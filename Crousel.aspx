<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Crousel.aspx.cs" Inherits="Crousel" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="UTF-8" />
    <title>Carousel</title>
    <link rel='stylesheet' href='css/slick.min.css' />
    <link rel='stylesheet' href='css/slick-theme.min.css' />
    <link rel="stylesheet" href="css/style.css" />
</head>

<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <h2>Carousel Stop on MouseOver</h2>

            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="carousel">
                        <asp:Repeater ID="mylist" runat="server">
                            <ItemTemplate>
                                <div>
                                    <asp:Image ID="Image1" runat="server" Height="160px" Width="180px" ImageUrl='<%# Eval("photopath","/img/{0}") %>' /><br />
                                    <asp:Label ID="lbl" runat="server" Text='<%# Bind("photoname") %>'></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:SqlDataSource ID="MyData" runat="server"></asp:SqlDataSource>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>

        <script src='js/jquery.min.js'></script>
        <script src='js/slick.min.js'></script>

        <script type="text/javascript">
            $(window).load(function () {
                $('.carousel').slick({
                    dots: false,
                    infinite: true,
                    slidesToShow: 6,
                    slidesToScroll: 1,
                    autoplay: true,
                    autoplaySpeed: 0,
                    arows: false,
                    speed: 1000,
                    centerMode: false,
                    pauseOnHover: true,
                    cssEase: 'linear',
                    initialSlide: 1,
                    draggable: false,
                    arrows: false
                });
            });
        </script>

        <br />
        <h3>Select the Image, Enter Image Name and <u>Press Key</u> or Click Submit Button for Submit
        </h3>

        <asp:Table ID="Table1" runat="server" Height="113px" Style="margin-bottom: 22px" Width="831px">

            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label1" runat="server" Text="Image"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:FileUpload ID="file" runat="server"></asp:FileUpload>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="file" ErrorMessage="*Please select image "></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="Label2" runat="server" Text="Path"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Panel ID="Panel1" runat="server" DefaultButton="Submit_btn">
                        <asp:TextBox ID="tb_imagename" runat="server"></asp:TextBox>
                        <asp:Button ID="Submit_btn" runat="server" Text="Submit" OnClick="Submit_btn_Click" />
                    </asp:Panel>


                    <label id="msg" runat="server" style="color: green"></label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tb_imagename" ErrorMessage="*Please enter Image Name"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>

    </form>

</body>
</html>
