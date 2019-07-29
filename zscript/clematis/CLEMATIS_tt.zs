class tt_Clematis abstract{
    bool VerboseEnabled;

    Array<uint> Failures;
    Array<uint> Successes;
    Array<uint> StartTimes;
    Array<uint> StartResultIndex;

    Array<Name> TestSuiteNames;

    Array<tt_Cl_Result> Results;

    static
    tt_Clematis Create(Class<tt_Clematis> Type)
    {return tt_Clematis(new(Type)).Init();}

    /* How to run
     * Runs test upon creation by default
     * With that setup one has 3 options
     *
     * 1. Console Command
     *     netevent test:tt_ClematisExample
     * 2. EventHandler call
     *     EventHandler.SendNetworkEvent('test:tt_ClematisExample');
     * 3. Factory method
     *     tt_Clematis.Create('tt_ClematisExample');
     *
     * Otherwise one can instantiate the test and call run on it
     *     tt_Clematis TestSuite=tt_Clematis.Create('tt_ClematisExample');
     *     TestSuite.Run();
     */

    virtual
    tt_Clematis Init(){
        Run();
        return self;
    }

    virtual
    void Run(){
        Reset();
        BeforeAll();
        TestSuites();
        AfterAll();
    }

    virtual
    void Reset(){}

    virtual
    void BeforeAll(){}

    virtual
    void TestSuites(){
        /* Example
         * Describe('Testing Player Stats');
         *     It('MaxHealth', AssertEval(MaxHealth, '<', 100), LOG_Warning);
         *     It('Math', AssertEval(1+1, '==', 2), LOG_Fatal);
         *     It('Woot', AssertTrue(exampleBool), LOG_Fatal);
         * EndDescribe();
         */
    }

    virtual
    void AfterAll(){}

    void Describe(Name TestSuiteName){
        TestSuiteNames.Push(int(TestSuiteName));
        StartResultIndex.Push(Results.Size());
        Failures.Push(0);
        Successes.Push(0);
        StartTimes.Push(MSTime());
        TabbedLog(LOG_None, "START SUITE: "..TestSuiteName);
    }

    void EndDescribe(){
        uint EndTime=MSTime()-StartTimes[StartTimes.Size()-1];
        StartTimes.Pop();
        uint StartIndex=StartResultIndex[StartResultIndex.Size()-1];
        StartResultIndex.Pop();
        TabbedLog(LOG_None, "END SUITE: "..TestSuiteNames[TestSuiteNames.Size()-1].." - Took ~"..EndTime.." ms");
        TabbedLog(LOG_None, TestsRunTotal().." Tests Run, "..SuccessesTotal().." Tests Succeeded, "..FailuresTotal().." Test Failed");
        TestSuiteNames.Pop();
        Successes.Pop();
        Failures.Pop();
    }

    void It(Name TestCaseName, tt_Cl_Assertion Assertion, tt_Cl_ELogSeverity Severity = LOG_Error){
        uint TimeBefore=MSTime();
        bool Condition=Assertion.Eval();
        uint TimeAfter=MSTime();
        uint DeltaTime=TimeAfter-TimeBefore;

        tt_Cl_Result Result=tt_Cl_Result.Create(TestCaseName, Condition, Severity, Assertion.ErrorMsg, DeltaTime);
        String Suff;
        if(Result.Success){
            Suff="Successful";
            Result.Severity=LOG_Info;
        }else
            Suff="Failure";
        TabbedLog(Result.Severity, "Task "..Result.Name..": "..Suff.." - Took ~"..Result.DeltaTime.." ms", 1);
        if(!Result.Success)
            TabbedLog(Result.Severity, Result.ErrorMsg, 1);
        AddTestsRunTotal(Result.Success);
    }

    void AddTestsRunTotal(bool Success){
        if(Success)
            for(int i=0; i<Successes.Size(); i++)
                Successes[i]++;
        else
            for(int i=0; i<Failures.Size(); i++)
                Failures[i]++;
    }

    uint SuccessesTotal() const
    {return Successes[Successes.Size()-1];}

    uint FailuresTotal() const
    {return Failures[Failures.Size()-1];}

    uint TestsRunTotal() const
    {return SuccessesTotal()+FailuresTotal();}

    void Log(tt_Cl_ELogSeverity Severity, String LogText, uint Offset=0, bool Verbose=false){
        if(!Verbose || VerboseEnabled)
            tt_Cl_Util.Log(GetClassName(), Severity, LogText, Offset);
    }

    void TabbedLog(tt_Cl_ELogSeverity Severity, String LogText, uint Offset=0, bool Verbose=false){
        if(!Verbose || VerboseEnabled)
            tt_Cl_Util.Log(GetClassName(), Severity, LogText, TestSuiteNames.Size()+Offset-1);
    }
}
