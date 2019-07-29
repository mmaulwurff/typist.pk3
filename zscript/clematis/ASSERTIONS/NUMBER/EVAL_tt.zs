class tt_Cl_AssertEval:tt_Cl_Assertion{
    double Val1,
           Val2;

    String Operator;

    static
    tt_Cl_Assertion Create(double Val1, String Operator, double Val2, String ErrorMsg=""){
        tt_Cl_AssertEval Result=new('tt_Cl_AssertEval');
        Result.Val1=Val1;
        Result.Operator=Operator;
        Result.Val2=Val2;
        if(ErrorMsg==""){
            if(Operator=="=" || Operator=="==" || Operator=="~=" || Operator=="~==")
                Result.ErrorMsg=String.Format("Values were not equal (%f vs %f)", Val1, Val2);
            else if(Operator=="<")
                Result.ErrorMsg=String.Format("Value1 (%f) was not less than Value2 (%f)", Val1, Val2);
            else if(Operator==">")
                Result.ErrorMsg=String.Format("Value1 (%f) was not greater than Value2 (%f)", Val1, Val2);
            else if(Operator=="<=")
                Result.ErrorMsg=String.Format("Value1 (%f) was not less than or equal to Value2 (%f)", Val1, Val2);
            else if(Operator==">=")
                Result.ErrorMsg=String.Format("Value1 (%f) was not greater than or equal to Value2 (%f)", Val1, Val2);
            else
                Result.ErrorMsg=String.Format("Unknown operator: %s", Operator);
        }else
            Result.ErrorMsg=ErrorMsg;
        return Result;
    }

    override
    bool Eval(){
        if(Operator=="=" || Operator=="==")
            return Val1==Val2;
        else if(Operator=="<")
            return Val1<Val2;
        else if(Operator==">")
            return Val1>Val2;
        else if(Operator=="<=")
            return Val1<=Val2;
        else if(Operator==">=")
            return Val1>=Val2;
        else if(Operator=="~=" || Operator=="~==")
            return Val1~==Val2;
        else
            return false;
    }
}

extend
class tt_Clematis{
    tt_Cl_Assertion AssertEval(double Val1, String Operator, double Val2, String ErrorMsg="")
    {return tt_Cl_AssertEval.Create(Val1, Operator, Val2, ErrorMsg);}
}
