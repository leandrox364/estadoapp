unit UMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Platform, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type
  TFrmMain = class(TForm)
    LabelStatus: TLabel;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Label1: TLabel;
    LabelTempo: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    function HandleAppEvent(AEvent: TApplicationEvent; AContext: TObject): Boolean;
    procedure EstadoApp(Ativo : boolean);

  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;
  AppAtivo : boolean;

implementation

{$R *.fmx}

procedure TFrmMain.EstadoApp(Ativo: boolean);
var
  minhaThread : TThread;
  Tempo : integer;
begin

  if Ativo then
  begin
    if AppAtivo = false then
       exit;

    AppAtivo := false;

    minhaThread := TThread.CreateAnonymousThread(
    procedure
    begin
       Tempo := 0;
       while not AppAtivo do
       begin
          inc(Tempo);

          Sleep(1000);

          if Tempo >= 10 then
             Application.Terminate;

          TThread.Synchronize(TThread.CurrentThread,
          procedure
          begin
             LabelTempo.Text := 'Tempo: '+ Tempo.ToString;
          end);

       end;

    end);
    minhaThread.FreeOnTerminate := true;
    minhaThread.Start;
  end
  else
    AppAtivo := true;

end;

procedure TFrmMain.FormCreate(Sender: TObject);
var
  LService: IFMXApplicationEventService;
begin

  if TPlatformServices.Current.
     SupportsPlatformService(IFMXApplicationEventService, IInterface(LService)) then
     LService.SetApplicationEventHandler(HandleAppEvent);

  AppAtivo := true;
end;

function TFrmMain.HandleAppEvent(AEvent: TApplicationEvent; AContext: TObject): Boolean;
begin
  Result := False;

  case AEvent of
    TApplicationEvent.FinishedLaunching:
    begin
      LabelStatus.Text := 'FinishedLaunching';
      EstadoApp(true);
    end;
    TApplicationEvent.BecameActive:
    begin
      LabelStatus.Text := 'BecameActive';
      EstadoApp(true);
    end;
    TApplicationEvent.WillBecomeForeground:
    begin
      LabelStatus.Text := 'WillBecomeForeground';
      EstadoApp(true);
    end;
    TApplicationEvent.WillTerminate:
    begin
      LabelStatus.Text := 'WillTerminate';
    end;
    TApplicationEvent.WillBecomeInactive:
    begin
      LabelStatus.Text := 'WillBecomeInactive';
      EstadoApp(false);
    end;
    TApplicationEvent.EnteredBackground:
    begin
      LabelStatus.Text := 'EnteredBackground';
      EstadoApp(false);
    end;
  end;

end;
end.                  
