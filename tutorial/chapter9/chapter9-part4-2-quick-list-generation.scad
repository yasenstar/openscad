//[1, 2, 3, 4, 5, 6]

x = [ for (i=[1:1:6]) i];
    echo(x);

//[10, 8, 6, 4, 2, 0, -2]

y = [ for (i=[10:-2:-2]) i];
    echo(y);

//[[3, 30], [4, 40], [5, 50], [6, 60]]

z = [ for (i=[3:1:6]) [i, i*10]];
    echo(z);