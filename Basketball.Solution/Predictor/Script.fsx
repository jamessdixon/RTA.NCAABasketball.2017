
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

let testTeam = {Id = "Foo3"; Region="Foo"; Seed=3; SeedWeight=10}
getTeamSeq testTeam

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

let getPool maxSeed = 
    teams
    |> Seq.filter(fun t -> t.Seed <= maxSeed)
    |> Seq.filter(fun t -> teamAvailable t)
    |> Seq.collect(fun t -> getTeamSeq t)
    |> Seq.toArray
    |> shuffle
    

let foo = getPool 8
let bar = 
    foo 
    |> Seq.groupBy(fun p -> p.Seed)
    |> Seq.map(fun (s, ta) -> s, ta |> Seq.length)

bar |> Seq.iter(fun t -> printfn "%A:%A" (fst t) (snd t))

let placeTeam poolSize placeDesc =
    let pool = getPool poolSize
    let index = random.Next(pool |> Seq.length)
    teamPredictions.Add({Team = pool.[index]; Place=placeDesc})


let createMadness = 
    //Madness
    //Need 1 with 6 wins from 1-8 seed
    //Need 2 more with 4 wins from 1-11 seed
    //Need 4 more with 3 wins from 1-12 seeds
    //Need 8 more with 2 wins from 1-15 seeds
    //Need 16 with 1 win from 1-16 seeds
    //Need 32 with 0 wins from 1-16 seeds
    placeTeam 8 "Champ"
    placeTeam 8 "RunnerUp"
    placeTeam 11 "FinalFour"
    placeTeam 11 "FinalFour"
    placeTeam 12 "Elite 8"
    placeTeam 12 "Elite 8"
    placeTeam 12 "Elite 8"
    placeTeam 12 "Elite 8"
    placeTeam 15 "SweeetSixteen"
    placeTeam 15 "SweeetSixteen"
    placeTeam 15 "SweeetSixteen"
    placeTeam 15 "SweeetSixteen"
    placeTeam 15 "SweeetSixteen"
    placeTeam 15 "SweeetSixteen"
    placeTeam 15 "SweeetSixteen"
    placeTeam 15 "SweeetSixteen"
    placeTeam 16 "FirstWin"
    placeTeam 16 "FirstWin"
    placeTeam 16 "FirstWin"
    placeTeam 16 "FirstWin"
    placeTeam 16 "FirstWin"
    placeTeam 16 "FirstWin"
    placeTeam 16 "FirstWin"
    placeTeam 16 "FirstWin"
    placeTeam 16 "FirstWin"
    placeTeam 16 "FirstWin"
    placeTeam 16 "FirstWin"
    placeTeam 16 "FirstWin"
    placeTeam 16 "FirstWin"
    placeTeam 16 "FirstWin"
    placeTeam 16 "FirstWin"
    placeTeam 16 "FirstWin"

    teamPredictions 
    |> Seq.iter(fun tp -> printfn "%s:%s" tp.Team.Id tp.Place)

let createReality = 
    //Normal
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

    teamPredictions 
    |> Seq.iter(fun tp -> printfn "%s:%s" tp.Team.Id tp.Place)
