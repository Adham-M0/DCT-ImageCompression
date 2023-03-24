%Function to split image into 8*8px blocks and Quantizing it
function y = Quantizing(I,r,DCTQ) 

T=r*DCTQ;

%splitting
[IHeight,IWidth]=size(I);
BlockSize = 8;
Index=1;
Quantizedimg = zeros(IHeight,IWidth);
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
        %Quantizing
        B = cast(TemporaryTile,'double');
        Quantizedblock = round(B./T); 
        Quantizedimg(Row:RowEnd,Column:ColumnEnd)=Quantizedblock;
        Index=Index+1;
         
    end
end 
y = Quantizedimg;
end