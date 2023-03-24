%Function to split image into 8*8px blocks and restoring it
function y = Restoring(I,C8,C8T) 

%splitting
[IHeight,IWidth]=size(I);
BlockSize = 8;
Index=1;
Restoredimg = zeros(IHeight,IWidth);
for Row = 1: +BlockSize: IHeight
    for Column = 1: +BlockSize: IWidth
        RowEnd= Row + BlockSize - 1;
        ColumnEnd = Column + BlockSize - 1;
        if RowEnd>IHeight
            RowEnd=IHeight;
        end
        if ColumnEnd>IWidth
            ColumnEnd=IWidth;
        end
        TemporaryTile=I(Row:RowEnd,Column:ColumnEnd);
        %restoring
        B = cast(TemporaryTile,'double');
        Restoredblock = C8T*B*C8;
        Restoredimg(Row:RowEnd,Column:ColumnEnd)=Restoredblock;
        Index=Index+1;
         
    end
end 
Restoredimg = uint8(Restoredimg);
y = Restoredimg;
end