class tt_Cl_AssertTrue:tt_Cl_Assertion{
    bool Condition;

    static
    tt_Cl_Assertion Create(bool Condition, String ErrorMsg=""){
        tt_Cl_AssertTrue Result=new('tt_Cl_AssertTrue');
        Result.Condition=Condition;
        if(ErrorMsg=="")
            Result.ErrorMsg="Value was not true";
        else
            Result.ErrorMsg=ErrorMsg;
        return Result;
    }

    override
    bool Eval()
    {return Condition;}
}

extend
class tt_Clematis{
    tt_Cl_Assertion Assert(bool Condition, String ErrorMsg="")
    {return tt_Cl_AssertTrue.Create(Condition, ErrorMsg);}
}
