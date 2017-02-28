unit frmEquiposPorEmpleadoQuitar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ZAbstractRODataset, ZDataset, global,
  Buttons, RXDBCtrl, Newpanel, ZAbstractDataset, StrUtils, DBCtrls, Mask,
  ComCtrls, frxClass, frxDBSet, DateUtils, RxMemDS, rxToolEdit, frmEmpleados,
  NxEdit, DBLabelEdit, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, dxLayoutContainer, dxLayoutControl, cxContainer, cxEdit,
  dxLayoutcxEditAdapters, cxDBEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, cxDBLabel, dxLayoutControlAdapters, Menus, cxButtons;

type
  Tfrm_EquiposPorEmpleadoQuitar = class(TForm)
  zqEquipos: TZQuery;
  zqEquiposiId: TIntegerField;
  zqEquiposiId_Categoria: TIntegerField;
  zqEquipossClave: TStringField;
  zqEquipossNombre: TStringField;
  zqEquipossModelo: TStringField;
  zqEquipossDescripcion: TStringField;
  dsEquipos: TDataSource;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dbEquipo: TcxDBLabel;
    dxLayoutControl1Item1: TdxLayoutItem;
    DbFechaRemocion: TcxDBDateEdit;
    dxLayoutControl1Item2: TdxLayoutItem;
    dbEstado: TcxDBTextEdit;
    dxLayoutControl1Item3: TdxLayoutItem;
    Button1: TcxButton;
    dxLayoutControl1Item4: TdxLayoutItem;
    Button2: TcxButton;
    dxLayoutControl1Item5: TdxLayoutItem;
    dxLayoutControl1Group1: TdxLayoutAutoCreatedGroup;
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure Button1Click(Sender: TObject);
  procedure Button2Click(Sender: TObject);
  procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var frm_EquiposPorEmpleadoQuitar: Tfrm_EquiposPorEmpleadoQuitar;
implementation
uses frm_Connection;
{$R *.dfm}
procedure Tfrm_EquiposPorEmpleadoQuitar.Button1Click(Sender: TObject);
begin
  try

    frm_Empleados.zq_EquiposPorEmpleado.FieldByName('bActivo').AsString:='No';
    frm_Empleados.zq_EquiposPorEmpleado.Post;
   { //Se actualiza el estatus del equipo a disponible
    connection.zCommand.Active := False;
    connection.zCommand.SQL.Clear;
    connection.zCommand.SQL.Add('Update con_catalogodeequipos set bStatus=1 Where iId =:Id ');
    connection.zcommand.Params.ParamByName('Id').DataType := ftInteger;
    connection.zcommand.Params.ParamByName('Id').value := frm_Empleados.zq_EquiposPorEmpleado.FieldByName('iIdEquipo').AsInteger;
    connection.zCommand.ExecSQL;
    //Se quita el equipo de equipo por empleado
    connection.zCommand.Active := False;
    connection.zCommand.SQL.Clear; }
    Close;
  except
    on e:Evalidaciones do messagedlg('Importante'+#13+#13+e.Message, mtinformation, [mbOk], 0);
    on E:Exception do ShowMessage('Ocurrio un error al Insertar, intentelo nuevamente mas tarde.' + E.Message);
  end;
end;

procedure Tfrm_EquiposPorEmpleadoQuitar.Button2Click(Sender: TObject);
begin
  frm_Empleados.zq_EquiposPorEmpleado.Cancel;
  Close;
end;

procedure Tfrm_EquiposPorEmpleadoQuitar.FormClose(Sender: TObject;
var Action: TCloseAction);
begin
  action := cafree ;
end;

procedure Tfrm_EquiposPorEmpleadoQuitar.FormShow(Sender: TObject);
begin
   DbFechaRemocion.date:=date;
   frm_Empleados.zq_EquiposPorEmpleado.Edit;
end;
end.
