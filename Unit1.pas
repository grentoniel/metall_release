unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MSAcc, FireDAC.Phys.MSAccDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  Vcl.StdCtrls, Vcl.ComCtrls, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, FireDAC.Phys.ODBCBase,
  Vcl.Menus, Unit2, Unit3;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    FDT_naimenovanie: TFDTable;
    FDT_naimenovanieid: TFDAutoIncField;
    FDT_naimenovanienaimen: TWideStringField;
    FDT_naimenovanievess: TFloatField;
    DataSource2: TDataSource;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    FDQuery2: TFDQuery;
    FDQuery2id: TFDAutoIncField;
    FDQuery2id_naimen: TIntegerField;
    FDQuery2ves: TSingleField;
    FDQuery2data: TWideStringField;
    FDQuery2naim: TStringField;
    FDTprim: TFDTable;
    FDTprimid: TFDAutoIncField;
    FDTprimprim: TWideStringField;
    FDQuery1: TFDQuery;
    FDQuery1id: TFDAutoIncField;
    FDQuery1id_naimen: TIntegerField;
    FDQuery1ves: TSingleField;
    FDQuery1data: TWideStringField;
    FDQuery1naimen: TStringField;
    DataSource1: TDataSource;
    FDConnection1: TFDConnection;
    Button2: TButton;
    DBNavigator1: TDBNavigator;
    StringGrid1: TStringGrid;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button4: TButton;
    Button3: TButton;
    DateTimePicker1: TDateTimePicker;
    TabSheet2: TTabSheet;
    DateTimePicker2: TDateTimePicker;
    StringGrid2: TStringGrid;
    Button5: TButton;
    StringGrid3: TStringGrid;
    FDQuery3: TFDQuery;
    DBGrid2: TDBGrid;
    DataSource3: TDataSource;
    DBNavigator2: TDBNavigator;
    FDQuery3id: TFDAutoIncField;
    FDQuery3id_posetitel: TIntegerField;
    FDQuery3id_metall: TIntegerField;
    FDQuery3ves: TSingleField;
    FDQuery3posetitel: TStringField;
    FDQuery3metall: TStringField;
    FDQuery1prim: TIntegerField;
    FDQuery2prim: TIntegerField;
    FDQuery2primprim: TIntegerField;
    FDQuery1primprim: TStringField;
    procedure DateTimePicker1Change(Sender: TObject);
    procedure FDQuery1AfterInsert(DataSet: TDataSet);
    procedure FDQuery1AfterPost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FDQuery3AfterInsert(DataSet: TDataSet);
    procedure FDQuery3BeforeInsert(DataSet: TDataSet);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FDQuery1AfterDelete(DataSet: TDataSet);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2Exit(Sender: TObject);
    procedure FDQuery1BeforeInsert(DataSet: TDataSet);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1Exit(Sender: TObject);
    procedure DBGrid1MouseLeave(Sender: TObject);
    procedure DBGrid2MouseLeave(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure DBNavigator1BeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure DBNavigator2BeforeAction(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
type tovar=record
   Name:string;
   Ves:real;
end;

var
  Form1: TForm1;
i,j,kol_tovar,m,n:integer;
kol:real;
str:string;
mas:array[1..100] of tovar;
flag_of_add_from_button:boolean;
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
if FDQuery1.State=dsEdit then FDQuery1.Post;
if FDQuery3.State=dsEdit then FDQuery3.Post;
if FDQuery1.Active=false then exit;

FDQuery1.Refresh;
FDQuery3.Refresh;
//очищаем конечную таблицу вне зависимости от того, будем работать или нет
StringGrid1.Cols[0].Clear;
StringGrid1.Cols[1].Clear;
StringGrid1.RowCount:=1;
StringGrid1.Cells[0,0]:='Наименование';
StringGrid1.Cells[1,0]:='Вес';
//проверяем на работоспособность сета, чтобы не тыкали с начала куда попало
if (FDQuery1.Active=false) or (FDQuery1.RecordCount=0) then
  begin
  exit;
  end;
kol:=0;
//для поиска используем массив mas типа товар с двумя значениями, сперва забираем 1 прогоном все
//из массива наименований и обнуляем гипотетическую таблицу
FDT_naimenovanie.Refresh;
FDT_naimenovanie.First;
FillChar(mas, SizeOf(mas), #0);
kol_tovar:=0;
for i := 1 to FDT_naimenovanie.RecordCount do
  begin
    inc(kol_tovar);
    mas[kol_tovar].Name:=FDT_naimenovanienaimen.AsString;
    mas[kol_tovar].Ves:=0;
    FDT_naimenovanie.next;
  end;
// теперь у нас есть список ВСЕХ возможных товаров
//мы пробежим запрос за день всего 1 раз и все заполним в массиве, затем выведем
//...массив пробегать проще
FDQuery1.First;
//побежали запрос
for i := 1 to FDQuery1.RecordCount do
  begin
    //побежали массив
    FDQuery3.Active:=false;
    FDQuery3.SQL.Clear;
    FDQuery3.SQL.Add('select * from vesa');
    FDQuery3.SQL.Add('where id_posetitel='+FDQuery1id.AsString);
    FDQuery3.Active:=true;
    if FDQuery3.RecordCount<>0 then
      begin
        FDQuery3.First;
        for j := 1 to FDQuery3.RecordCount do
         begin
          for m := 1 to kol_tovar do
          begin
            //если мы нашли, то все здорово - плюсуем, считаем, все круто.
            if mas[m].Name=FDQuery3metall.AsString then
              begin
               mas[m].Ves:=mas[m].Ves+FDQuery3ves.AsFloat;
              end;
          end;
         FDQuery3.Next;
        end;
      end;
  FDQuery1.Next;
  end;
//у нас есть уже готовы стрингрид, в него и грузим.
for i := 1 to kol_tovar do
  begin
   if mas[i].Ves<>0 then
    begin
     StringGrid1.RowCount:=StringGrid1.RowCount+1;
     StringGrid1.Cells[0,StringGrid1.RowCount-1]:=mas[i].Name;
     StringGrid1.Cells[1,StringGrid1.RowCount-1]:=floattostr(mas[i].Ves);
    end;
  end;
//отрисовали красоту фиксации
StringGrid1.FixedCols:=1;
if StringGrid1.RowCount>1 then
  begin
    StringGrid1.FixedRows:=1;
  end;
StringGrid1.ColWidths[0]:=300;
StringGrid1.ColWidths[1]:=50;

//не забыть все вернуть на 1 места
FDQuery1.First;
FDQuery3.Active:=false;
FDQuery3.SQL.Clear;
FDQuery3.SQL.Add('select * from vesa');
FDQuery3.SQL.Add('where id_posetitel='+FDQuery1id.AsString);
FDQuery3.Active:=true;




end;

procedure TForm1.Button2Click(Sender: TObject);
begin
FDQuery3.SQL.Clear;
FDQuery3.SQL.Add('select *');
FDQuery3.SQL.Add('from vesa');
FDQuery3.Active:=true;
if FDT_naimenovanie.Active=false  then
  begin
    FDT_naimenovanie.Active:=true;
  end;
//очищаем конечную таблицу вне зависимости от того, будем работать или нет
StringGrid1.Cols[0].Clear;
StringGrid1.Cols[1].Clear;
StringGrid1.RowCount:=1;
StringGrid1.Cells[0,0]:='Наименование';
StringGrid1.Cells[1,0]:='Вес';
//для поиска используем массив mas типа товар с двумя значениями, спекрва забираем 1 прогоном все
//из массива наименований и обнуляем гипотетическую таблицу
FDT_naimenovanie.Refresh;
FDT_naimenovanie.First;
FillChar(mas, SizeOf(mas), #0);
kol_tovar:=0;
for i := 1 to FDT_naimenovanie.RecordCount do
  begin
    inc(kol_tovar);
    mas[kol_tovar].Name:=FDT_naimenovanienaimen.AsString;
    mas[kol_tovar].Ves:=0;
    FDT_naimenovanie.next;
  end;
FDQuery3.Active:=false;
FDQuery3.Active:=true;
// теперь у нас есть список ВСЕХ возможных товаров
//мы пробежим запрос за день всего 1 раз и все заполним в массиве, затем выведем
//...массив пробегать проще
FDQuery3.First;
//побежали запрос
for i := 1 to FDQuery3.RecordCount do
  begin
    //побежали массив
            for m := 1 to kol_tovar do
            begin
              //если мы нашли, то все здорово - плюсуем, считаем, все круто.
              if mas[m].Name=FDQuery3metall.AsString then
                begin
                 mas[m].Ves:=mas[m].Ves+FDQuery3ves.AsFloat;
                end;
            end;
            //идем на следующую запись
  FDQuery3.Next;
  end;
//у нас есть уже готовы стрингрид, в него и грузим.
for i := 1 to kol_tovar do
  begin
   if mas[i].Ves<>0 then
    begin
     StringGrid1.RowCount:=StringGrid1.RowCount+1;
     StringGrid1.Cells[0,StringGrid1.RowCount-1]:=mas[i].Name;
     StringGrid1.Cells[1,StringGrid1.RowCount-1]:=floattostr(mas[i].Ves);
    end;
  end;
//отрисовали красоту фиксации
StringGrid1.FixedCols:=1;
StringGrid1.FixedRows:=1;
StringGrid1.ColWidths[0]:=300;
StringGrid1.ColWidths[1]:=50;

//возвращаем все назад
DateTimePicker1.OnChange(Sender);

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
//универсальный справочнико-правитель
//в зависимости от кнопки подключаем необходимую таблицу и отрисовываем корректное отображение
form2.DataSource1.DataSet:=Form2.FDTable1;
Form2.FDTable1.Active:=true;
form2.DBGrid1.Columns[0].FieldName:='naimen';
form2.DBGrid1.Columns[0].Width:=500;
form2.DBGrid1.Columns[0].Title.Caption:='Наименование';
Form2.Show;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
//универсальный справочнико-правитель
//в зависимости от кнопки подключаем необходимую таблицу и отрисовываем корректное отображение
form2.DataSource1.DataSet:=Form2.FDTable2;
Form2.FDTable2.Active:=true;
form2.DBGrid1.Columns[0].FieldName:='prim';
form2.DBGrid1.Columns[0].Width:=500;
form2.DBGrid1.Columns[0].Title.Caption:='Поставщик';
Form2.Show;

end;

procedure TForm1.Button5Click(Sender: TObject);
begin
DateTimePicker2.OnChange(Self);
end;

procedure TForm1.DateTimePicker1Change(Sender: TObject);
begin

FDQuery1.SQL.Clear;
FDQuery1.SQL.Add('select * from main_table');
FDQuery1.SQL.Add('where data='+#39+FormatDateTime('dd.mm.yyyy', DateTimePicker1.Date)+#39);
FDQuery1.Active:=true;

if FDQuery1.RecordCount>0 then
  begin
    FDQuery3.Active:=false;
    FDQuery3.SQL.Clear;
    FDQuery3.SQL.Add('select * from vesa');
    FDQuery3.SQL.Add('where id_posetitel='+FDQuery1id.AsString);
    FDQuery3.Active:=true;
  end;





end;

procedure TForm1.DateTimePicker2Change(Sender: TObject);
var
massiv_of_prim:array [1..150] of string;
kol_prim,sum:integer;
s:string;
begin
//схитрим - дату синхронзируем и пересчитаем все через кнопку на 1м табе.
DateTimePicker1.Date:=DateTimePicker2.Date;
DateTimePicker1.OnChange(DateTimePicker2);
Button1.Click;
//у нас по итогу енсть запрос который мыф за 1 раз пробежим, теперь его просто надо вывести в грид.
//начинаем с 1 колонки - не забываем про сокращения.
StringGrid2.ColCount:=1;
StringGrid2.RowCount:=1;
//StringGrid2.Cells[0,0]:='Примечание';
StringGrid2.DefaultColWidth:=250;
//3 грид
StringGrid3.ColCount:=1;
StringGrid3.RowCount:=1;
StringGrid3.Cells[0,0]:='Примечание';
StringGrid3.ColWidths[0]:=200;
//перебираем все наименования металлов и вносим их в грид
if FDT_naimenovanie.Active=false then FDT_naimenovanie.Active:=true;

FDT_naimenovanie.Refresh;
FDT_naimenovanie.First;
for i := 1 to FDT_naimenovanie.RecordCount do
  begin
    StringGrid2.ColCount:=StringGrid2.ColCount+1;
    StringGrid2.Cells[StringGrid2.ColCount-2,0]:=FDT_naimenovanienaimen.AsString;
    FDT_naimenovanie.next;
  end;
  StringGrid2.ColCount:=StringGrid2.ColCount-1;


if FDQuery1.RecordCount=0 then
  begin
    Exit;
  end;

 //перебор ВСЕХ примечаний за текущий день, подсчет, выгрузка
 //пробегаем все примечания, делаем запрос
 //пробегаем стринггриб вправо и плючуем
 FDTprim.First;
 for i := 1 to FDTprim.RecordCount do
   begin
      FDQuery1.SQL.Clear;
      FDQuery1.SQL.Add('select * from main_table');
      FDQuery1.SQL.Add('where data='+#39+FormatDateTime('dd.mm.yyyy', DateTimePicker1.Date)+#39+' and prim='+FDTprimid.AsString);
      FDQuery1.Active:=true;
      if FDQuery1.RecordCount<>0 then
        begin
          FDQuery1.First;
          for j := 1 to FDQuery1.RecordCount do
            begin
              // подбиваем металлы за текущий день от текущего поставщика
              FDQuery3.Active:=false;
              FDQuery3.SQL.Clear;
              FDQuery3.SQL.Add('select * from vesa');
              FDQuery3.SQL.Add('where id_posetitel='+FDQuery1id.AsString);
              FDQuery3.Active:=true;
              //припервой записи - добавляем грид
              if j=1 then
                begin
                  StringGrid2.RowCount:=StringGrid2.RowCount+1;
                  StringGrid3.RowCount:=StringGrid3.RowCount+1;
                  StringGrid3.Cells[0,StringGrid2.RowCount-1]:=FDQuery1primprim.AsString;
                  for kol_prim := 0 to StringGrid2.ColCount-1 do StringGrid2.Cells[kol_prim,StringGrid2.RowCount-1]:='0'
                end;
                if FDQuery3.RecordCount>0 then
                  begin
                    for j := 1 to FDQuery3.RecordCount do
                      begin
                          for kol_prim := 0 to StringGrid2.ColCount-1 do
                            begin
                              if FDQuery3metall.AsString=StringGrid2.Cells[kol_prim,0] then
                                begin
                                  StringGrid2.Cells[kol_prim,StringGrid2.RowCount-1]:=floattostr(strtofloat(StringGrid2.Cells[kol_prim,StringGrid2.RowCount-1])+FDQuery3ves.AsFloat);
                                end;
                            end;
                      FDQuery3.Next;
                      end;
                  end;
              FDQuery1.Next;
            end;
        end;
      FDTprim.Next;
   end;

  //подсчет итогов
  StringGrid2.RowCount:=StringGrid2.RowCount+1;
  StringGrid3.RowCount:=StringGrid2.RowCount+1;
 // StringGrid2.Cells[0,StringGrid2.RowCount-1]:='Итого';
  StringGrid3.Cells[0,StringGrid2.RowCount-1]:='Итого';
  //суммируем итоги и скрываем лишнее
  for i := 0 to StringGrid2.ColCount-1 do
      begin
      sum:=0;
        for j := 1 to StringGrid2.RowCount-2 do
          begin
            sum:=sum+StrToInt(StringGrid2.Cells[i,j]);
          end;
          StringGrid2.Cells[i,StringGrid2.RowCount-1]:=IntToStr(sum);
          if sum=0 then
            begin
               StringGrid2.Cols[i].Clear;
               StringGrid2.ColWidths[i]:=1;
            end;
      end;
   StringGrid3.RowCount:=StringGrid3.RowCount-1;
//вернуть все на круги своЯ
DateTimePicker1.OnChange(Sender);

end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);
begin
FDQuery3.Active:=false;
FDQuery3.SQL.Clear;
FDQuery3.SQL.Add('select * from vesa');
FDQuery3.SQL.Add('where id_posetitel='+FDQuery1id.AsString);
FDQuery3.Active:=true;



end;

procedure TForm1.DBGrid1Enter(Sender: TObject);
begin

//грузим примечания в пиклист столбца
{DBGrid1.Columns[0].PickList.Clear;
FDTprim.Active:=true;
FDTprim.First;
for i := 1 to FDTprim.RecordCount do
  begin
    DBGrid1.Columns[0].PickList.Add(FDTprimprim.AsString);
    FDTprim.Next;
  end; }
end;

procedure TForm1.DBGrid1Exit(Sender: TObject);
begin
if FDQuery1.State=dsEdit then
  begin
    FDQuery1.Post;
  end;

end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=VK_RETURN then
  begin
    if FDQuery1.State=dsEdit then
      begin
        FDQuery1.Post;
      end;
  end;
end;

procedure TForm1.DBGrid1MouseLeave(Sender: TObject);
begin
if FDQuery1.State=dsEdit then
  begin
    FDQuery1.Post;
  end;

end;

procedure TForm1.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
         if FDQuery1id.AsInteger=FDQuery3id.AsInteger then
          begin
//           DBGrid2.Canvas.Font.Color := clBlue;
//           dbGrid2.DefaultDrawColumnCell(Rect,DataCol,Column,State);
          end;
end;

procedure TForm1.DBGrid2Exit(Sender: TObject);
begin
if FDQuery3.State=dsEdit then
  begin
    FDQuery3.Post;
  end;



end;

procedure TForm1.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=VK_RETURN then
  begin
    if FDQuery3.State=dsEdit then
      begin
        FDQuery3.Post;
      end;
  end;
end;

procedure TForm1.DBGrid2MouseLeave(Sender: TObject);
begin
if FDQuery3.State=dsEdit then
  begin
    FDQuery3.Post;
  end;
end;

procedure TForm1.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
if Button=nbDelete then
  begin
    Exit;
  end;


//гтовим комбобокс со списком
form3.ComboBox1.Items.Clear;
form3.ComboBox2.Items.Clear;
FDTprim.Refresh;
FDTprim.First;

for i := 1 to FDTprim.RecordCount do
  begin
    Form3.ComboBox1.Items.Add(FDTprimprim.AsString);
    Form3.ComboBox2.Items.Add(inttostr(FDTprimid.AsInteger));
    FDTprim.Next;
  end;
Form3.ComboBox1.ItemIndex:=1;
Form3.ComboBox2.ItemIndex:=1;

//готовим грид для заполнения на 3 форме
//подгрпужаем весь список металлов и обнуляем

Form3.StringGrid1.RowCount:=1;
Form3.StringGrid1.ColCount:=3;
Form3.StringGrid1.RowCount:=FDT_naimenovanie.RecordCount+1;
FDT_naimenovanie.Refresh;
FDT_naimenovanie.First;
Form3.StringGrid1.Cells[0,0]:='Номер';
Form3.StringGrid1.Cells[1,0]:='Наименование';
Form3.StringGrid1.Cells[2,0]:='Вес';
form3.StringGrid1.FixedCols:=2;
Form3.StringGrid1.FixedRows:=1;
for i:= 1 to FDT_naimenovanie.RecordCount do
begin
  form3.StringGrid1.Cells[0,i]:=IntToStr(FDT_naimenovanieid.AsInteger);
  form3.StringGrid1.Cells[1,i]:=FDT_naimenovanienaimen.AsString;
  form3.StringGrid1.Cells[2,i]:='0';
  FDT_naimenovanie.Next;
end;

Form3.StringGrid1.ColWidths[0]:=50;
Form3.StringGrid1.ColWidths[1]:=350;
Form3.StringGrid1.ColWidths[2]:=50;
Form3.ShowModal;






end;

procedure TForm1.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin

//

end;

procedure TForm1.DBNavigator2BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
if Button=nbDelete then
  begin
    exit;
  end;
 flag_of_add_from_button:=true;



if (FDQuery1.Active=false) or (FDQuery1.RecordCount=0) then
  begin
    Exit
  end;
{FDQuery3id_posetitel.AsInteger:=FDQuery1id.AsInteger;
FDQuery3id_metall.AsInteger:=1;
FDQuery3ves.AsFloat:=0;
FDQuery3.Post;   }




end;

procedure TForm1.FDQuery1AfterDelete(DataSet: TDataSet);
begin
FDQuery1.Refresh;
FDQuery3.Refresh;
end;

procedure TForm1.FDQuery1AfterInsert(DataSet: TDataSet);
begin
if Form3.Tag<>1 then
  begin
    FDQuery1.Cancel;
    Exit;
  end;
//пробегаем форму добавления!!!!!
FDQuery1id_naimen.AsInteger:=1;
FDQuery1prim.AsInteger:=strtoint(Form3.ComboBox2.Text);
FDQuery1data.AsString:=FormatDateTime('dd.mm.yyyy', DateTimePicker1.Date);
FDQuery1.Post;
FDQuery1.Refresh;
FDQuery1.Last;

//добавляем то что есть в гриде на 3 форме
for i :=1 to Form3.StringGrid1.RowCount-1 do
  begin
     if form3.StringGrid1.Cells[2,i]<>'0' then
      begin
        FDQuery3.Insert;
        FDQuery3id_posetitel.AsInteger:=FDQuery1id.AsInteger;
        FDQuery3id_metall.AsInteger:=strtoint(Form3.StringGrid1.Cells[0,i]);
        FDQuery3ves.AsFloat:=strtoint(Form3.StringGrid1.Cells[2,i]);
        FDQuery3.Post;
      end;
  end;
FDQuery3.Refresh;
FDQuery3.First;
end;

procedure TForm1.FDQuery1AfterPost(DataSet: TDataSet);
begin
FDQuery1.Refresh;

FDQuery3.Active:=false;
FDQuery3.SQL.Clear;
FDQuery3.SQL.Add('select * from vesa');
FDQuery3.SQL.Add('where id_posetitel='+FDQuery1id.AsString);
FDQuery3.Active:=true;


end;

procedure TForm1.FDQuery1BeforeInsert(DataSet: TDataSet);
begin
//проверяем будем ли вообще добавлять
if Form3.Tag<>1 then
  begin
    FDQuery1.Cancel;
    Exit;
  end;
end;

procedure TForm1.FDQuery3AfterInsert(DataSet: TDataSet);
begin
//проверка на дурака - уходим если пусто
if (FDQuery1.Active=false) or (FDQuery1.RecordCount=0) then
  begin
    Exit
  end;
//флажок откуда добавляем ...да некрасиво ,не провеффисонально, да костыль, но работает, это заплатка.
//для добавления дополнительных металлов абы чего
if flag_of_add_from_button=true then
  begin
    flag_of_add_from_button:=false;
    FDQuery3id_posetitel.AsInteger:=FDQuery1id.AsInteger;
    FDQuery3id_metall.AsInteger:=1;
    FDQuery3ves.AsFloat:=0;
    FDQuery3.Post;
  end;

end;

procedure TForm1.FDQuery3BeforeInsert(DataSet: TDataSet);
begin
//берем строку
//str:=FDQuery1prim.AsString;
//проверка на дурака - уходим если пусто
if (FDQuery1.Active=false) or (FDQuery1.RecordCount=0) then
  begin
   Exit;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  MyClass: TComponent;
begin
//выбираем дату - сегодня
DateTimePicker1.Date:=Date;
DateTimePicker2.Date:=Date;
//подключаем БД
str:=GetCurrentDir;
FDConnection1.DriverName:='MSAcc';
FDConnection1.LoginPrompt:=false;
FDConnection1.Params.Database:=str+'\um.mdb';
FDConnection1.Connected:=true;
//грузим примечания в пиклист столбца
{DBGrid1.Columns[0].PickList.Clear;
FDTprim.Active:=true;
FDTprim.First;
for i := 1 to FDTprim.RecordCount do
  begin
    DBGrid1.Columns[0].PickList.Add(FDTprimprim.AsString);
    FDTprim.Next;
  end;    }
end;

procedure TForm1.FormResize(Sender: TObject);
begin
//просто отрисовка грида при изменении
//DBGrid1.Columns[2].Width:=DBGrid1.Width-350;
DBGrid2.Columns[0].Width:=800;
//DBGrid1.Columns[1].Width:=400;
//DBGrid1.Columns[2].Width:=600;
//DBGrid1.Columns[3].Width:=200;



end;

procedure TForm1.N2Click(Sender: TObject);
begin
Button1.Click;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
Button3.Click;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
Application.Terminate;
end;

end.
