class tt_Cl_Result{
    bool Success;

    uint DeltaTime;

    Name Name;

    String ErrorMsg;

    tt_Cl_ELogSeverity Severity;

    static
    tt_Cl_Result Create(Name Name, bool Success, tt_Cl_ELogSeverity Severity, String ErrorMsg, uint DeltaTime){
        tt_Cl_Result Result=new('tt_Cl_Result');
        Result.Name=Name;
        Result.Success=Success;
        Result.Severity=Severity;
        Result.ErrorMsg=ErrorMsg;
        Result.DeltaTime=DeltaTime;
        return Result;
    }
}
