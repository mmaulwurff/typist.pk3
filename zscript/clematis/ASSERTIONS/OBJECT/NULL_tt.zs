class tt_Cl_AssertNull:tt_Cl_Assertion{
    Object Value;

    static
    tt_Cl_Assertion Create(Object Value, String ErrorMsg=""){
        tt_Cl_AssertNull Result=new('tt_Cl_AssertNull');
        Result.Value=Value;
        if(ErrorMsg=="")
            Result.ErrorMsg="Value was not null";
        else
            Result.ErrorMsg=ErrorMsg;
        return Result;
    }

    override
    bool Eval()
    {return !Value;}
}

extend
class tt_Clematis{
    tt_Cl_Assertion AssertNull(Object Value, String ErrorMsg="")
    {return tt_Cl_AssertNull.Create(Value, ErrorMsg);}
}
