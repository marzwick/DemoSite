using StatsPlots
using Luxor

# Example plot used in contribution guide
p = plot(title="Fruit in my Cart", size=(800, 600), xlabel="Fruit", ylabel="Amount in Cart")
plot!(p, ["Apple", "Banana", "Carrot"], [3, 4, 5], seriestype=:bar, label=nothing)
savefig(p, "site/src/assets/fruit-in-my-cart.svg")

# effects-of-a-utility-value-intervention-on-urm-students.svg
size = (790, 444)
p = plot(
    title="Effects of a Utility-Value Intervention on URM Students",
    size=size,
    margin=5Plots.mm,
    ylabel="Proportion Probable or Declared STEM Major",
    ylims=(.50, 1.00),
    xticks=(1:7, ["Start of Chem", "End of Chem", "Spring Year 1", "Fall Year 2", "Spring Year 2", "Fall Year 3", "Spring Year 3"])
)

## Control
plot!([1, 2],       [.94, .90], seriestype=:line, marker=:o, color=:grey, label="Control")
plot!([3, 4, 5, 6], [.77, .67, .63, .56], seriestype=:line, marker=:o, color=:grey, label=nothing)
plot!([7],          [.55], seriestype=:line, marker=:o, color=:grey, label=nothing)

## Intervention
plot!([1, 2],       [.94, .94], seriestype=:line, marker=:o, color=:purple, label="Intervention")
plot!([3, 4, 5, 6], [.71, .78, .71, .74], seriestype=:line, marker=:o, color=:purple, label=nothing)
plot!([7],          [.69], seriestype=:line, marker=:o, color=:purple, label=nothing)

## Annotations
annotate!(p, 1.5, .975, StatsPlots.text("(A)", :center, :black, 12))
annotate!(p, 4.5, .8, StatsPlots.text("(B)", :center, :black, 12))
annotate!(p, 7, .73, StatsPlots.text("(C)", :center, :black, 12))

savefig(p, "site/src/assets/effects-of-a-utility-value-intervention-on-urm-students.svg")

# would-jennifer-or-john-be-hired.svg
size = (790, 444)
p = plot(title="Would Jennifer or John be hired?", size=size, margin=5Plots.mm, ylabel="Rating (scale of 1 to 5)", ylims=(0,5))
plot!(p, ["Female Target", "Male Target"], [2.9, 3.83], seriestype=:bar, label=nothing)
annotate!(p, 1, 4.5, StatsPlots.text("t(125) = 4.22, p < .001, d = .70", :center, :black, 12))
savefig(p, "site/src/assets/would-jennifer-or-john-be-hired.svg")

# would-jennifer-or-john-receive-mentoring.svg
size = (790, 444)
p = plot(title="Would Jennifer or John receive mentoring?", size=size, margin=5Plots.mm, ylabel="Rating (scale of 1 to 5)", ylims=(0,5))
plot!(p, ["Female Target", "Male Target"], [3.955, 4.735], seriestype=:bar, label=nothing)
annotate!(p, 1, 4.9, StatsPlots.text("t(125) = 3.43, p < .01, d = .60", :center, :black, 12))
savefig(p, "site/src/assets/would-jennifer-or-john-receive-mentoring.svg")

# how-much-would-jennifer-or-john-be-paid.svg
size = (790, 444)
p = plot(title="How much would Jennifer or John be paid?", size=size, margin=5Plots.mm, ylabel="Salary (in US Dollars)", ylims=(25000,31000), yformatter=:plain)
plot!(p, ["Female Target", "Male Target"], [26507.94, 30238.10], seriestype=:bar, label=nothing)
annotate!(p, 1, 30500, StatsPlots.text("t(125) = 2.94, p < .01, d = .51", :center, :black, 12))
savefig(p, "site/src/assets/how-much-would-jennifer-or-john-be-paid.svg")

# did-the-gender-of-the-faculty-affect-hiring.svg
size = (790, 444)
p = plot(title="Did the gender of the faculty evaluator affect hiring?", size=size, margin=5Plots.mm, ylabel="Rating (scale of 1 to 5)", ylims=(0,5), legend=:outertopright)
groupedbar!(p,
    ["Female Target", "Female Target", "Male Target", "Male Target"],
    [2.84, 2.96, 3.92, 3.74],
    group=["Female Faculty", "Male Faculty", "Female Faculty", "Male Faculty"]
)
annotate!(p, 1, 4.8, StatsPlots.text("Condition: f(1,126) = 13.43, p < .001", :center, :black, 12))
annotate!(p, 1, 4.5, StatsPlots.text("Gender: f(1, 126) = .12, ns", :center, :black, 12))
annotate!(p, 1, 4.2, StatsPlots.text("Condition X Gender: f(1, 126) = .03, ns", :center, :black, 12))
savefig(p, "site/src/assets/did-the-gender-of-the-faculty-affect-hiring.svg")

# six-facets-of-science.svg
let ## local scope
    @svg begin
        ## Set font
        fontface("Helvetica-Bold")

        ## Plot title
        top = Point(0, -220)
        fontsize(16)
        setcolor("black")
        Luxor.text("Six Facets of Science", top, halign=:center, valign=:top)

        ## Facet labels and colors
        facets = [
            "Science Practices" => "#1a6b25",
            "Iteration" => "#197e3e",
            "Discovery" => "#189360",
            "Authenticity" => "#15a98e",
            "Ownership" => "#14b6be",
            "Relevance" => "#0e9ed5"
        ]

        ## Adjust rotation we start at
        p = Point(0, -135)
        delta = 2π/length(facets)
        offset = 2π/12
        Luxor.rotate(offset)

        ## Pie slices
        for color in last.(facets)
            setcolor(color)
            Luxor.pie(200, π+delta, π+2delta, action=:fill)
            Luxor.rotate(delta)
        end

        ## Write facet labels
        fontsize(14)
        setcolor("white")
        angle = -offset
        for label in first.(facets)
            Luxor.text(label, p, halign=:center, valign=:middle, angle=angle)
            Luxor.rotate(delta)
            angle -= delta
        end
    end 444 444 "site/src/assets/six-facets-of-science.svg" # @svg
end ## let

# five-dimensions-of-inclusive-teaching.svg
let ## local scope
    @svg begin
        ## Set font
        fontsize(16)
        fontface("Helvetica-Bold")

        ## Plot title
        top = Point(0, -220)
        setcolor("black"); Luxor.text("Five Dimensions of Inclusive Teaching", top, halign=:center, valign=:top)

        ## Draw circles with text
        climate = Point(0,0)
        setcolor("#209cee"); circle(climate, 50, action=:fill)
        setcolor("white"); Luxor.text("Climate", climate, halign=:center, valign=:middle)

        instructors = Point(0, -140)
        setcolor("#209cee"); circle(instructors, 50, action=:fill)
        setcolor("white"); Luxor.text("Instructors", instructors, halign=:center, valign=:middle)

        students = Point(0, 140)
        setcolor("#209cee"); circle(students, 50, action=:fill)
        setcolor("white"); Luxor.text("Students", students, halign=:center, valign=:middle)

        curriculum = Point(-140, 0)
        setcolor("#209cee"); circle(curriculum, 50, action=:fill)
        setcolor("white"); Luxor.text("Curriculum", curriculum, halign=:center, valign=:middle)

        pedagogy = Point(140, 0)
        setcolor("#209cee"); circle(pedagogy, 50, action=:fill)
        setcolor("white"); Luxor.text("Pedagogy", pedagogy, halign=:center, valign=:middle)

        ## Connect Climate to the other four
        setcolor("#209cee")
        points = [instructors, pedagogy, students, curriculum]
        for point in points
            Luxor.arrow(between(climate, point, [.5, .6])..., linewidth=4)
            Luxor.arrow(between(point, climate, [.5, .6])..., linewidth=4)
        end

        ## Connect each of the outer points to their neighbors before/after them
        for a in eachindex(points)
            b = a + 1
            if b > length(points)
                b = 1
            end

            Luxor.arrow(between(points[a], points[b], [.5, .7])..., linewidth=4)
            Luxor.arrow(between(points[b], points[a], [.5, .7])..., linewidth=4)
        end
    end 444 444 "site/src/assets/five-dimensions-of-inclusive-teaching.svg" ## @svg
end ## let

# five-dimensions-of-inclusive-teaching-hori.svg
let ## local scope
    @svg begin
        ## Set font
        fontsize(16)
        fontface("Helvetica-Bold")

        ## Plot title
        top = Point(0, -220)
        setcolor("black"); Luxor.text("Five Dimensions of Inclusive Teaching", top, halign=:center, valign=:top)

        ## Draw circles with text
        climate = Point(0,0)
        circlesize = 50
        setcolor("#209cee"); circle(climate, circlesize, action=:fill)
        setcolor("white"); Luxor.text("Climate", climate, halign=:center, valign=:middle)

        circleoffset = 140
        instructors = Point(0, -circleoffset)
        setcolor("#209cee"); circle(instructors, circlesize, action=:fill)
        setcolor("white"); Luxor.text("Instructors", instructors, halign=:center, valign=:middle)

        students = Point(0, circleoffset)
        setcolor("#209cee"); circle(students, circlesize, action=:fill)
        setcolor("white"); Luxor.text("Students", students, halign=:center, valign=:middle)

        curriculum = Point(-circleoffset, 0)
        setcolor("#209cee"); circle(curriculum, circlesize, action=:fill)
        setcolor("white"); Luxor.text("Curriculum", curriculum, halign=:center, valign=:middle)

        pedagogy = Point(circleoffset, 0)
        setcolor("#209cee"); circle(pedagogy, circlesize, action=:fill)
        setcolor("white"); Luxor.text("Pedagogy", pedagogy, halign=:center, valign=:middle)

        ## Connect Climate to the other four
        setcolor("#209cee")
        points = [instructors, pedagogy, students, curriculum]
        for point in points
            Luxor.arrow(between(climate, point, [.5, .6])..., linewidth=4)
            Luxor.arrow(between(point, climate, [.5, .6])..., linewidth=4)
        end

        ## Connect each of the outer points to their neighbors before/after them
        for a in eachindex(points)
            b = a + 1
            if b > length(points)
                b = 1
            end

            Luxor.arrow(between(points[a], points[b], [.5, .7])..., linewidth=4)
            Luxor.arrow(between(points[b], points[a], [.5, .7])..., linewidth=4)
        end

        horioffset = Point(2*circlesize, 0)
        # NOTE: 450 is the "sum of the distances of a point on the perimeter to the two focii" that gives us a pleasant curve
        # See: https://juliagraphics.github.io/Luxor.jl/stable/howto/simplegraphics/
        setcolor("red"); Luxor.ellipse(curriculum-horioffset, pedagogy+horioffset, 450, action=:stroke)
    end 460 460 "site/src/assets/five-dimensions-of-inclusive-teaching-hori.svg" ## @svg
end ## let

# five-dimensions-of-inclusive-teaching-vert.svg
let ## local scope
    @svg begin
        ## Set font
        fontsize(16)
        fontface("Helvetica-Bold")

        ## Plot title
        top = Point(0, -220)
        setcolor("black"); Luxor.text("Five Dimensions of Inclusive Teaching", top, halign=:center, valign=:top)

        ## Draw circles with text
        climate = Point(0,0)
        circlesize = 50
        setcolor("#209cee"); circle(climate, circlesize, action=:fill)
        setcolor("white"); Luxor.text("Climate", climate, halign=:center, valign=:middle)

        circleoffset = 140
        instructors = Point(0, -circleoffset)
        setcolor("#209cee"); circle(instructors, circlesize, action=:fill)
        setcolor("white"); Luxor.text("Instructors", instructors, halign=:center, valign=:middle)

        students = Point(0, circleoffset)
        setcolor("#209cee"); circle(students, circlesize, action=:fill)
        setcolor("white"); Luxor.text("Students", students, halign=:center, valign=:middle)

        curriculum = Point(-circleoffset, 0)
        setcolor("#209cee"); circle(curriculum, circlesize, action=:fill)
        setcolor("white"); Luxor.text("Curriculum", curriculum, halign=:center, valign=:middle)

        pedagogy = Point(circleoffset, 0)
        setcolor("#209cee"); circle(pedagogy, circlesize, action=:fill)
        setcolor("white"); Luxor.text("Pedagogy", pedagogy, halign=:center, valign=:middle)

        ## Connect Climate to the other four
        setcolor("#209cee")
        points = [instructors, pedagogy, students, curriculum]
        for point in points
            Luxor.arrow(between(climate, point, [.5, .6])..., linewidth=4)
            Luxor.arrow(between(point, climate, [.5, .6])..., linewidth=4)
        end

        ## Connect each of the outer points to their neighbors before/after them
        for a in eachindex(points)
            b = a + 1
            if b > length(points)
                b = 1
            end

            Luxor.arrow(between(points[a], points[b], [.5, .7])..., linewidth=4)
            Luxor.arrow(between(points[b], points[a], [.5, .7])..., linewidth=4)
        end

        vertoffset = Point(0, 2*circlesize)
        # NOTE: 450 is the "sum of the distances of a point on the perimeter to the two focii" that gives us a pleasant curve
        # See: https://juliagraphics.github.io/Luxor.jl/stable/howto/simplegraphics/
        setcolor("red"); Luxor.ellipse(instructors-vertoffset, students+vertoffset, 450, action=:stroke)
    end 460 460 "site/src/assets/five-dimensions-of-inclusive-teaching-vert.svg" ## @svg
end ## let