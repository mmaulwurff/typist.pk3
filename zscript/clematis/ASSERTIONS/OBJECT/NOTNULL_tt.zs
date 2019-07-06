class tt_Cl_AssertNotNull:tt_Cl_Assertion{
    Object Value;

    static
    tt_Cl_Assertion Create(Object Value, String ErrorMsg=""){
        tt_Cl_AssertNotNull Result=new('tt_Cl_AssertNotNull');
        Result.Value=Value;
        if(ErrorMsg=="")
            Result.ErrorMsg="Value was null";
        else
            Result.ErrorMsg=ErrorMsg;
        return Result;
    }

    override
    bool Eval()
    {return Value;}
}

extend
class tt_Clematis{
    tt_Cl_Assertion AssertNotNull(Object Value, String ErrorMsg="")
    {return tt_Cl_AssertNotNull.Create(Value, ErrorMsg);}
}
