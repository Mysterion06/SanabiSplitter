//Credits Mysterion352
//Commissioned by SMARTFRIDGE

state("SNB"){
    //float igt: "GameAssembly.dll", 0x03C7A278, 0xB8, 0x10, 0x78, 0x20, 0x120, 0x78, 0x10;
    float igt: "GameAssembly.dll", 0x3CA85B0, 0x210, 0xA48, 0x38, 0x50, 0x120, 0x78, 0x10;
    int level: "GameAssembly.dll", 0x3C97A88, 0xB8, 0x20, 0x18, 0x10, 0xF0, 0x18;
}

init{
    vars.totalTime = 0;
}

update{
    if(timer.CurrentPhase == TimerPhase.NotRunning){
        vars.totalTime = 0;
    }
}

split{
    if(current.level == 0 && old.level > 0){
        return true;
    }
}

isLoading{
    return true;
}

gameTime{
    if(current.igt < old.igt){
        vars.totalTime = Math.Round(vars.totalTime + old.igt, 2);
    }
    return TimeSpan.FromSeconds(Math.Round(vars.totalTime + current.igt, 2));
}
