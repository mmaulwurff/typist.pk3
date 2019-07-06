class tt_Cl_AssertFalse:tt_Cl_Assertion{
    bool Condition;

    static
    tt_Cl_Assertion Create(bool Condition, String ErrorMsg=""){
        tt_Cl_AssertFalse Result=new('tt_Cl_AssertFalse');
        Result.Condition=Condition;
        if(ErrorMsg=="")
            Result.ErrorMsg="Value was not false";
        else
            Result.ErrorMsg=ErrorMsg;
        return Result;
    }

    override
    bool Eval()
    {return !Condition;}
}

extend
class tt_Clematis{
    tt_Cl_Assertion AssertFalse(bool Condition, String ErrorMsg="")
    {return tt_Cl_AssertFalse.Create(Condition, ErrorMsg);}
}
