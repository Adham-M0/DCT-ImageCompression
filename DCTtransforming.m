
%Function to split image into 8*8px blocks and transforming it using DCT
function y = DCTtransforming(I,C8,C8T) 

%splitting
[IHeight,IWidth]=size(I);
BlockSize = 8;
Index=1;
DCTImg = zeros(IHeight,IWidth);
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
        %transforming
        B = cast(TemporaryTile,'double');
        DCTBlock=C8*B*C8T;
        DCTImg(Row:RowEnd,Column:ColumnEnd)=DCTBlock;
        Index=Index+1;
         
    end
end 
y = DCTImg;
end