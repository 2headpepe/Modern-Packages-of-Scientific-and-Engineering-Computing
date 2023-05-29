function retval = zig_zag(n)
    idx = 0;
    x = -1;
    y = 1;
    x1 = 1;
    y1 = -1;
    flag = true;
    arr = zeros(n,n);
    cols = n;
    rows = n;

    while (idx < rows * cols)
        while (y > 0 && x < cols - 1)
            --y, ++x, ++idx;
            arr(y+1, x+1) = idx;
        endwhile

        if (y == 0 && x < cols - 1)
            ++x;
        else
            ++y;
        endif

        ++idx;
        arr(y+1, x+1) = idx;

        if (idx != cols * rows)
            while (y < rows - 1 && x > 0)
                ++idx;
                ++y;
                --x;
                arr(y+1, x+1) = idx;
            endwhile

            if (x == 0 && y < rows - 1)
                ++y;
            else
                ++x;
            endif

            ++idx;
            arr(y+1, x+1) = idx;
        endif
    endwhile

    disp(arr);
endfunction
