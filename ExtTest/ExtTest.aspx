<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExtTest.aspx.cs" Inherits="ExtTest.ExtTest" %>

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script runat="server">
        
        public class Sample
        {
            public int Id { get; set; }
            public string Field1 { get; set; }
            public string Field2 { get; set; }
        }

        public static List<Sample> GetSampleAll()
        {
            return new List<Sample>
            {
                new Sample{
                    Id=1,
                    Field1="qwert1",
                    Field2="asdfg1",
                },
                new Sample{
                    Id=2,
                    Field1="qwert2",
                    Field2="asdfg2",
                },
                new Sample{
                    Id=3,
                    Field1="qwert3",
                    Field2="asdfg3",
                },
                
            };
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Store_DataBind();
        }

        public void Store_DataBind()
        {
            store.DataSource = GetSampleAll();
            store.DataBind();
        }

        [DirectMethod]
        public void SetRowFields()
        {
            var row = store.GetById(TextFieldId.Text);
            row.Set("Field1", TextField1.Text);
            row.Set("Field2", TextField2.Text);
        }
        
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <ext:ResourceManager runat="server"></ext:ResourceManager>
            <ext:Viewport runat="server" Layout="BorderLayout">
                <Items>
                    <ext:FormPanel runat="server" Region="North" Layout="VBoxLayout">
                        <Items>
                            <ext:ProgressBar runat="server" ID="prc"> 
                            </ext:ProgressBar>
                            <ext:TextField ID="TextFieldId" runat="server" FieldLabel="Id"></ext:TextField> 
                            <ext:TextField ID="TextField1" runat="server" FieldLabel="Field 1"></ext:TextField>
                            <ext:TextField ID="TextField2" runat="server" FieldLabel="Field 2"></ext:TextField> 
                            <ext:Button runat="server" Text="Set Row Fields">
                                <Listeners>
                                    <Click Handler="App.direct.SetRowFields();"></Click>
                                </Listeners>
                            </ext:Button>
                        </Items>
                    </ext:FormPanel>
                    <ext:GridPanel runat="server" ID="grid" Region="Center">
                        <ColumnModel>
                            <Columns>
                                <ext:Column ID="Column1" runat="server" DataIndex="Id" Text="Id"></ext:Column>
                                <ext:Column ID="Column2" runat="server" DataIndex="Field1" Text="Field 1"></ext:Column>
                                <ext:Column ID="Column3" runat="server" DataIndex="Field2" Text="Field 1"></ext:Column>
                            </Columns>
                        </ColumnModel>
                        <Store>
                            <ext:Store runat="server" ID="store">
                                <Model>
                                    <ext:Model runat="server" IDProperty="Id">
                                        <Fields>
                                            <ext:ModelField Name="Id"></ext:ModelField>
                                            <ext:ModelField Name="Field1"></ext:ModelField>
                                            <ext:ModelField Name="Field2"></ext:ModelField>
                                        </Fields>
                                    </ext:Model>
                                </Model>
                            </ext:Store>
                        </Store>
                    </ext:GridPanel>
                </Items>
            </ext:Viewport>
        </div>
    </form>
</body>
</html>
