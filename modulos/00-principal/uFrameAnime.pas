unit uFrameAnime;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXCtrls;

type
  Tfrm_animation = class(TFrame)
    ActivityIndicator: TActivityIndicator;
    procedure FrameResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure Tfrm_animation.FrameResize(Sender: TObject);
begin
  ActivityIndicator.Left := Trunc(Self.ClientWidth / 2) -
    Trunc(ActivityIndicator.Width / 2);
  ActivityIndicator.Top := Trunc(Self.ClientHeight / 2) -
    Trunc(ActivityIndicator.Height / 2);
end;

end.
