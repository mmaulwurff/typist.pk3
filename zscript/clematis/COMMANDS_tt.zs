class tt_ClematisTestHandler:StaticEventHandler{
    override
    void NetworkProcess(ConsoleEvent e){
        String TestName=e.Name;
        TestName.ToLower();
        if(TestName.IndexOf("test:")!=-1)
            tt_Clematis.Create(TestName.Mid(5));
    }
}
