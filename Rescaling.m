%Function to split image into 8*8px blocks and upQuantizing it
function y = Rescaling(I,r,DCTQ)

T=r*DCTQ;

%splitting
[IHeight,IWidth]=size(I);
BlockSize = 8;
Index=1;
Rescalededimg = zeros(IHeight,IWidth);
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
        %upQuantizing
        B = cast(TemporaryTile,'double');
        Rescaledblock = round(B.*T); 
        Rescalededimg(Row:RowEnd,Column:ColumnEnd)=Rescaledblock;
        Index=Index+1;
         
    end
end 
y = Rescalededimg;
end