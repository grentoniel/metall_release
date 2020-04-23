unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls;

type
  TForm3 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
Form3.Tag:=1;
form3.Close;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
form3.Tag:=0;
Form3.Close;
end;

procedure TForm3.ComboBox1Change(Sender: TObject);
begin
ComboBox2.ItemIndex:=ComboBox1.ItemIndex;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//
end;

end.
