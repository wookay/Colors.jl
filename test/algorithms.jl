using Test, Colors

@test isconcretetype(eltype(colormap("Grays")))

@test_throws ArgumentError colormap("Grays", N=10)

col = distinguishable_colors(10)
@test isconcretetype(eltype(col))
mindiff = Inf
for i = 1:10
    for j = i+1:10
        global mindiff = min(mindiff, colordiff(col[i], col[j]))
    end
end
@test mindiff > 8
