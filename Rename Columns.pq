let
Source = (TableName as table) =>
 let
    ReorderColumns = Table.ReorderColumns(TableName,List.Sort(Table.ColumnNames(TableName),each Text.Length(_))),
    RenameColumns = Table.TransformColumnNames(ReorderColumns, each if Text.Contains(_,"view.") then "View " & Number.ToText(Number.RoundDown(((Text.Length(_)-29)/10))) else if Text.Contains(_,"viewfolder.") then "Viewfolder " & Number.ToText(Number.RoundDown(((Text.Length(_)-24)/10))) else "remove"),
    RemoveColumns = Table.RemoveColumns(RenameColumns, List.Select(Table.ColumnNames(RenameColumns), each Text.Contains(_, "remove")))
 in 
     RemoveColumns
in
    Source
