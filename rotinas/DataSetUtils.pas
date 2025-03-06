unit DataSetUtils;

interface

uses
  Vcl.Forms,

  System.Classes,
  System.SysUtils,
  System.TypInfo,
  System.Generics.Collections,
  System.Rtti,

  FireDAC.Stan.Def,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,

  ormbr.types.blob,
  ormbr.types.nullable;

type
  TEnumTipoProduto = (tp0, tp1, tp2, tp3, tp4, tp5, tp6);

  TDataSetHelper = class
  public
    class procedure PreencheDataSet<T: class>(const AListaObjeto: TObjectList<T>; ADataSet: TFDMemTable);
  end;

implementation

{ TDataSetHelper }

uses
  Data.DB;

class procedure TDataSetHelper.PreencheDataSet<T>(
  const AListaObjeto: TObjectList<T>; ADataSet: TFDMemTable);
var
  RttiContext: TRttiContext;
  RttiType: TRttiType;
  RttiProperty: TRttiProperty;
  HasValidData: Boolean;
  FieldName: string;
  Objeto: T;
begin
  RttiContext := TRttiContext.Create;
  try
    RttiType := RttiContext.GetType(TypeInfo(T));
  //    ADataSet.Fields.Clear;
    if ADataSet.Fields.Count = 0 then
    // Definindo os campos no DataSet
    for RttiProperty in RttiType.GetProperties do
    begin
      // Adicione o campo correspondente ao FDMemTable
      if RttiProperty.PropertyType.Handle = TypeInfo(Nullable<Integer>) then
        ADataSet.FieldDefs.Add(RttiProperty.Name, ftInteger)
      else if RttiProperty.PropertyType.Handle = TypeInfo(Nullable<String>) then
        ADataSet.FieldDefs.Add(RttiProperty.Name, ftString, 255)
      else if RttiProperty.PropertyType.Handle = TypeInfo(Nullable<Currency>) then
        ADataSet.FieldDefs.Add(RttiProperty.Name, ftCurrency)
      else if RttiProperty.PropertyType.Handle = TypeInfo(String) then
        ADataSet.FieldDefs.Add(RttiProperty.Name, ftString, 255)
      else if RttiProperty.PropertyType.Handle = TypeInfo(Integer) then
        ADataSet.FieldDefs.Add(RttiProperty.Name, ftInteger)
      else if RttiProperty.PropertyType.Handle = TypeInfo(TDateTime) then
        ADataSet.FieldDefs.Add(RttiProperty.Name, ftDateTime)
      else if RttiProperty.PropertyType.Handle = TypeInfo(Nullable<TDateTime>) then
        ADataSet.FieldDefs.Add(RttiProperty.Name, ftDateTime)
      else if RttiProperty.PropertyType.Handle = TypeInfo(Boolean) then
        ADataSet.FieldDefs.Add(RttiProperty.Name, ftBoolean)
      else if RttiProperty.PropertyType.Handle = TypeInfo(Currency) then
        ADataSet.FieldDefs.Add(RttiProperty.Name, ftCurrency)
      else if RttiProperty.PropertyType.Handle = TypeInfo(TBlob) then
        ADataSet.FieldDefs.Add(RttiProperty.Name, ftBlob)
      else if RttiProperty.PropertyType.Name = 'TEnumTipoProduto' then
        ADataSet.FieldDefs.Add(RttiProperty.Name, ftInteger)
      else if RttiProperty.PropertyType.Name = 'TEnumOperacao' then
        ADataSet.FieldDefs.Add(RttiProperty.Name, ftString)
      else if RttiProperty.PropertyType.Name = 'TEnumTipoMoeda' then
        ADataSet.FieldDefs.Add(RttiProperty.Name, ftString)
      else if RttiProperty.PropertyType.Name = 'TEnumTipoMovimento' then
        ADataSet.FieldDefs.Add(RttiProperty.Name, ftString);
      // Adicione outras verificações para diferentes tipos, se necessário
    end;
    // Cria o DataSet apenas uma vez
    if not ADataSet.Active then
      ADataSet.CreateDataSet
    else
      ADataSet.EmptyDataSet;
    // Percorrendo a lista de objetos
    for Objeto in AListaObjeto do
    begin
      ADataSet.Append;
      HasValidData := False;
      // Processar cada propriedade
      for RttiProperty in RttiType.GetProperties do
      begin
        if RttiProperty.IsReadable then
        begin
          FieldName := RttiProperty.Name;
          // Para Nullable<Integer>
          if RttiProperty.PropertyType.Handle = TypeInfo(Nullable<Integer>) then
          begin
            var NullableValue := RttiProperty.GetValue(TObject(Objeto)).AsType<Nullable<Integer>>;
            if NullableValue.HasValue then
            begin
              ADataSet.FieldByName(FieldName).AsInteger := NullableValue.Value;
              HasValidData := True;
            end
            else
              ADataSet.FieldByName(FieldName).Clear;
          end
          // Para Nullable<String>
          else if RttiProperty.PropertyType.Handle = TypeInfo(Nullable<String>) then
          begin
            var NullableValue := RttiProperty.GetValue(TObject(Objeto)).AsType<Nullable<String>>;
            if NullableValue.HasValue then
            begin
              ADataSet.FieldByName(FieldName).AsString := NullableValue.Value;
              HasValidData := True;
            end
            else
              ADataSet.FieldByName(FieldName).Clear;
          end
          // Para Nullable<Currency>
          else if RttiProperty.PropertyType.Handle = TypeInfo(Nullable<Currency>) then
          begin
            var NullableValue := RttiProperty.GetValue(TObject(Objeto)).AsType<Nullable<Currency>>;
            if NullableValue.HasValue then
            begin
              ADataSet.FieldByName(FieldName).AsCurrency := NullableValue.Value;
              HasValidData := True;
            end
            else
              ADataSet.FieldByName(FieldName).Clear;
          end
          // Para String
          else if RttiProperty.PropertyType.Handle = TypeInfo(String) then
          begin
            var Value := RttiProperty.GetValue(TObject(Objeto)).AsType<String>;
            if Length(Value) > 0 then
            begin
              ADataSet.FieldByName(FieldName).AsString := Value;
              HasValidData := True;
            end
            else
              ADataSet.FieldByName(FieldName).Clear;
          end
          // Para Integer
          else if RttiProperty.PropertyType.Handle = TypeInfo(Integer) then
          begin
            var Value := RttiProperty.GetValue(TObject(Objeto)).AsType<Integer>;
            if Value>= 0 then
            begin
              ADataSet.FieldByName(FieldName).AsInteger := Value;
              HasValidData := True;
            end
            else
              ADataSet.FieldByName(FieldName).Clear;
          end
          // Para Currency
          else if RttiProperty.PropertyType.Handle = TypeInfo(Currency) then
          begin
            var Value := RttiProperty.GetValue(TObject(Objeto)).AsType<Currency>;
            if Value >= 0 then
            begin
              ADataSet.FieldByName(FieldName).AsCurrency := Value;
              HasValidData := True;
            end
            else
              ADataSet.FieldByName(FieldName).Clear;
          end
          // Para TDateTime
          else if RttiProperty.PropertyType.Handle = TypeInfo(TDateTime) then
          begin
            var Value := RttiProperty.GetValue(TObject(Objeto)).AsType<TDateTime>;
            if Value > 0 then
            begin
              ADataSet.FieldByName(FieldName).AsDateTime := Value;
              HasValidData := True;
            end
            else
              ADataSet.FieldByName(FieldName).Clear;
          end
          // Para Nullable<TDateTime>
          else if RttiProperty.PropertyType.Handle = TypeInfo(Nullable<TDateTime>) then
          begin
            var NullableValue := RttiProperty.GetValue(TObject(Objeto)).AsType<Nullable<TDateTime>>;
            if NullableValue.HasValue then
            begin
              ADataSet.FieldByName(FieldName).AsDateTime := NullableValue.Value;
              HasValidData := True;
            end
            else
              ADataSet.FieldByName(FieldName).Clear;
          end
          // Para Boolean
          else if RttiProperty.PropertyType.Handle = TypeInfo(Boolean) then
          begin
            var Value := RttiProperty.GetValue(TObject(Objeto)).AsType<Boolean>;
            ADataSet.FieldByName(FieldName).AsBoolean := Value;
            HasValidData := True;
          end
          // Para TBlob
          else if RttiProperty.PropertyType.Handle = TypeInfo(TBlob) then
          begin
            var BlobValue := RttiProperty.GetValue(TObject(Objeto));

            // Verifica se o valor é nulo
            if not BlobValue.IsEmpty then
              begin
               var
                  caminho := ExtractFilePath(Application.ExeName) + 'img.jpg';

                  var Value := RttiProperty.GetValue(TObject(Objeto)).AsType<TBlob>;

                  Value.SaveToFile(caminho);

                  (ADataSet.FieldByName(FieldName) as TBlobField).LoadFromFile(caminho);
                  HasValidData := True;

                  DeleteFile(caminho);
              end
            else
              ADataSet.FieldByName(FieldName).Clear;
          end
          // Para TEnumTipoProduto
          else if RttiProperty.PropertyType.IsOrdinal then
          begin
            if RttiProperty.PropertyType.Name = 'TEnumTipoProduto' then
            begin
              var Value := RttiProperty.GetValue(TObject(Objeto)).AsVariant;
              ADataSet.FieldByName(FieldName).AsInteger := Value;
              HasValidData := True;
            end;
          end
          // Para TEnumTipoMoeda
          else if RttiProperty.PropertyType.IsOrdinal then
          begin
            if RttiProperty.PropertyType.Name = 'TEnumTipoMoeda' then
            begin
              var Value := RttiProperty.GetValue(TObject(Objeto)).AsVariant;
              ADataSet.FieldByName(FieldName).AsString := Value;
              HasValidData := True;
            end;
          end
          // Para TEnumOperacao
          else if RttiProperty.PropertyType.IsOrdinal then
          begin
            if RttiProperty.PropertyType.Name = 'TEnumOperacao' then
            begin
              var Value := RttiProperty.GetValue(TObject(Objeto)).AsVariant;
              ADataSet.FieldByName(FieldName).AsString := Value;
              HasValidData := True;
            end;
          end
          // Para TEnumTipoMovimento
          else if RttiProperty.PropertyType.IsOrdinal then
          begin
            if RttiProperty.PropertyType.Name = 'TEnumTipoMovimento' then
            begin
              var Value := RttiProperty.GetValue(TObject(Objeto)).AsVariant;
              ADataSet.FieldByName(FieldName).AsString := Value;
              HasValidData := True;
            end;
          end;
          // Adicione outros tipos conforme necessário
        end;
      end;
      // Postar apenas se houver dados válidos
      if HasValidData then
        ADataSet.Post
      else
        ADataSet.Cancel;
    end;
  finally
    RttiContext.Free;
  end;
end;

end.
