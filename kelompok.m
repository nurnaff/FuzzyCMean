%membaca data project yang akan ditentukan green atau red
A=xlsread('data fifa.xls','A2:AT2500');
%membaca data nilai centroid cluster green and red
C=xlsread('cluster2.xls','A5:AT7');
%membaca ukuran data
[baris, kolom]=size(A);
%proses menghitung manhatt setiap baris data dengan centroid cluster 1 dan 2
for i=1:baris
    for j=1:kolom
        kelas1=sqrt(sum((A(i,j)-C(1,j)).^2));
        kelas2=sqrt(sum((A(i,j)-C(2,j)).^2));
        kelas3=sqrt(sum((A(i,j)-C(3,j)).^2));
    end
   if(kelas1<kelas2)
       if (kelas1<kelas3)
           H(i)="Cluster 1";
       else
           H(i)="Cluster 3";
       end
   else
       H(i)="Cluster 2";
   end
end
H=H';
xlswrite('Hasil.xls',H);