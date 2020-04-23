unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.MSAcc, FireDAC.Phys.MSAccDef, FireDAC.VCLUI.Wait, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.DBCtrls, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Phys.ODBCBase;

type
  TForm2 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    FDTable1: TFDTable;
    FDConnection1: TFDConnection;
    FDTable1id: TFDAutoIncField;
    FDTable1naimen: TWideStringField;
    DBNavigator1: TDBNavigator;
    StatusBar1: TStatusBar;
    FDPhysMSAccessDriverLink1: TFDPhysMSAccessDriverLink;
    FDTable2: TFDTable;
    FDTable2id: TFDAutoIncField;
    FDTable2prim: TWideStringField;
    procedure FormCreate(Sender: TObject);
    procedure FDTable1AfterPost(DataSet: TDataSet);
    procedure FDTable1AfterInsert(DataSet: TDataSet);
    procedure FDTable2AfterInsert(DataSet: TDataSet);
    procedure FDTable2AfterPost(DataSet: TDataSet);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1MouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}
//здесь (4 процедуры вниз) жестко прикручиваем добавление, чтобы не заносили фигню в служебные поля, не более
procedure TForm2.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=VK_RETURN then
  begin
    if FDTable1.State=dsEdit then
      begin
        FDTable1.Post;
      end;
  end;

if Key=VK_RETURN then
  begin
    if FDTable2.State=dsEdit then
      begin
        FDTable2.Post;
      end;
  end;

end;

procedure TForm2.DBGrid1MouseLeave(Sender: TObject);
begin
    if FDTable1.State=dsEdit then
      begin
        FDTable1.Post;
      end;

    if FDTable2.State=dsEdit then
      begin
        FDTable2.Post;
      end;

end;

procedure TForm2.FDTable1AfterInsert(DataSet: TDataSet);
begin
FDTable1naimen.AsString:='Новое наименование';
FDTable1.Post;
end;

procedure TForm2.FDTable1AfterPost(DataSet: TDataSet);
begin
FDTable1.Refresh;
end;

procedure TForm2.FDTable2AfterInsert(DataSet: TDataSet);
begin
FDTable2prim.AsString:='Новое наименование';
FDTable2.Post;

end;

procedure TForm2.FDTable2AfterPost(DataSet: TDataSet);
begin
FDTable2.Refresh;
end;
//подключаем субд
procedure TForm2.FormCreate(Sender: TObject);
var
str:string;
begin
str:=GetCurrentDir;
form2.FDConnection1.DriverName:='MSAcc';
form2.FDConnection1.LoginPrompt:=false;
form2.FDConnection1.Params.Database:=str+'\um.mdb';
form2.FDConnection1.Connected:=true;
form2.FDTable1.Active:=true;
end;

end.
