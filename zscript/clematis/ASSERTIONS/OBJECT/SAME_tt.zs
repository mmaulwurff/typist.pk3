class tt_Cl_AssertSame:tt_Cl_Assertion{
    Object Val1,
           Val2;

    static
    tt_Cl_Assertion Create(Object Val1, Object Val2, String ErrorMsg=""){
        tt_Cl_AssertSame Result=new('tt_Cl_AssertSame');
        Result.Val1=Val1;
        Result.Val2=Val2;
        if(ErrorMsg=="")
            Result.ErrorMsg="Values were not the same";
        else
            Result.ErrorMsg=ErrorMsg;
        return Result;
    }

    override
    bool Eval()
    {return Val1==Val2;}
}

extend
class tt_Clematis{
    tt_Cl_Assertion AssertSame(Object Val1, Object Val2, String ErrorMsg="")
    {return tt_Cl_AssertSame.Create(Val1, Val2, ErrorMsg);}
}
