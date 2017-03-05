
open System
open System.Collections.Generic

type Team = {Id: String; Region: string; Seed: int; SeedWeight: int}

let coefficients = 
    [2.2567402; 2.0871546 ; 1.9175691; 
    1.7479835; 1.5783980; 1.4088124; 
    1.2392268; 1.0696413; 0.9000557; 
    0.7304701; 0.5608846; 0.3912990; 
    0.2217135; 0.0521279; 0.0; 0.0]

let odds = 
    coefficients
    |> Seq.mapi(fun i c -> i+1, (c/2.5)*100.0)
    |> Seq.map(fun o -> fst o, snd o |> int)

let regions = ["MW";"W";"S";"E"]

let createTeam region seed =
    let odd = odds |> Seq.find(fun o -> fst o = seed)
    {Id = region + seed.ToString(); Region=region; Seed=seed; SeedWeight=snd odd}

let teams = 
    [1..16]
    |> Seq.collect(fun s -> regions |> Seq.map(fun r -> createTeam r s))

let getTeamSeq t =
    [1 .. t.SeedWeight]
    |> Seq.map(fun i -> t)

type TeamPrediction = {Team: Team; Place: string}

let teamPredictions = List<TeamPrediction>()

let random = new Random(42)
let swap (a: _[]) x y =
    let tmp = a.[x]
    a.[x] <- a.[y]
    a.[y] <- tmp

let shuffle a =
    Array.iteri (fun i _ -> swap a i (random.Next(i, Array.length a))) a
    a

let teamAvailable t =
    teamPredictions
    |> Seq.exists(fun tp -> tp.Team.Id = t.Id)
    |> not

let regionAvailable t round =
    let maxNumber =
        match round with
        | 1 -> 8 //first win
        | 2 -> 4 //sweet sixteen
        | 3 -> 2 //elite 8
        | 4 -> 1 //final 4
        | _ -> 1 //final game

    let regionCount = 
        teamPredictions
        |> Seq.filter(fun tp -> tp.Team.Region = t.Region)
        |> Seq.length

    maxNumber > regionCount
    

let getPool maxSeed round = 
    teams
    |> Seq.filter(fun t -> t.Seed <= maxSeed)
    |> Seq.filter(fun t -> teamAvailable t)
    |> Seq.filter(fun t -> regionAvailable t round)
    |> Seq.collect(fun t -> getTeamSeq t)
    |> Seq.toArray
    |> shuffle
    
let placeTeam poolSize placeDesc =
    let round = 
        match placeDesc with
        | "Champ" -> 6
        | "RunnerUp" -> 5
        | "FinalFour" -> 4
        | "Elite 8" -> 3
        | "SweeetSixteen" -> 2
        | "FirstWin" -> 1
        | _ -> 0

    let pool = getPool poolSize round
    let index = random.Next(pool |> Seq.length)
    teamPredictions.Add({Team = pool.[index]; Place=placeDesc})

//Need 1 with 6 wins from 1 or 2 seed - champ
//Need 1 more with 5 wins from 1,2,5,6 seed - runner up
//Need 2 more with 4 wins from 1,2,5,6 seed - final 4
//Need 4 more with 3 wins from 1-6 seeds - elite 8
//Need 8 more with 2 wins from 1-12 seeds - sweet sixteen
//Need 16 with 1 win from 1-12 seeds - first v
//Need 32 with 0 wins from 5-16 seeds
placeTeam 2 "Champ"
placeTeam 2 "RunnerUp"
placeTeam 6 "FinalFour"
placeTeam 6 "FinalFour"
placeTeam 6 "Elite 8"
placeTeam 6 "Elite 8"
placeTeam 6 "Elite 8"
placeTeam 6 "Elite 8"
placeTeam 12 "SweeetSixteen"
placeTeam 12 "SweeetSixteen"
placeTeam 12 "SweeetSixteen"
placeTeam 12 "SweeetSixteen"
placeTeam 12 "SweeetSixteen"
placeTeam 12 "SweeetSixteen"
placeTeam 12 "SweeetSixteen"
placeTeam 12 "SweeetSixteen"
placeTeam 12 "FirstWin"
placeTeam 12 "FirstWin"
placeTeam 12 "FirstWin"
placeTeam 12 "FirstWin"
placeTeam 12 "FirstWin"
placeTeam 12 "FirstWin"
placeTeam 12 "FirstWin"
placeTeam 12 "FirstWin"
placeTeam 12 "FirstWin"
placeTeam 12 "FirstWin"
placeTeam 12 "FirstWin"
placeTeam 12 "FirstWin"
placeTeam 12 "FirstWin"
placeTeam 12 "FirstWin"
placeTeam 12 "FirstWin"
placeTeam 12 "FirstWin"

teamPredictions |> Seq.iter(fun tp -> printfn "%s:%s" tp.Team.Id tp.Place);;
