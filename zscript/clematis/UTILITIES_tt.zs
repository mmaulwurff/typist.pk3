enum tt_Cl_ELogSeverity{
    LOG_None,
    LOG_Info,
    LOG_Warning,
    LOG_Error,
    LOG_Fatal,
}

class tt_Cl_Util{
    static
    clearscope
    void Print(String Output, Name CVarName, bool Mid=false){
        if(CVar.FindCVar(CVarName).GetBool()){
            if(Mid)
                Console.MidPrint(SmallFont, Output);
            else
                Console.PrintF(Output);
        }
    }

    static
    clearscope
    void Log(Name Owner, tt_Cl_ELogSeverity Severity, String LogText, uint Offset=0){
        String Color, Result;
        [Color, Result]=LogLabel(Severity);
        if(Result!="")
            Result=Result.." - ";
        for(int i=0; i<Offset; i++)
            Result=" "..Result;
        if(Owner!='')
            Result="["..Owner.."] "..Result;
        LogText=Color..Result..LogText;
        if(Severity==LOG_Fatal)
            ThrowAbortException(LogText);
        else
            Console.PrintF(LogText);
    }

    static
    clearscope
    String, String LogLabel(tt_Cl_ELogSeverity Severity){
        switch(Severity){
            case LOG_Info:      return "",      "INFO";
            case LOG_Warning:   return "\cx",   "WARN";
            case LOG_Error:     return "\cr",   "ERROR";
            case LOG_Fatal:     return "\cy",   "FATAL";
            default:            return "",      "";
        }
    }
}
