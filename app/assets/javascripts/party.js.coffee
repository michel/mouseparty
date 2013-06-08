$ ->
  width = $(window).width()
  height = $(window).height()
  colors = d3.scale.category20c()
  i = 0

  particle = ->
    m = d3.svg.mouse(this)
    svg.append("svg:circle")
        .attr("cx", m[0])
        .attr("cy", m[1])
        .attr("r", 1e-6)
        .style("stroke", colors(++i))
        .style("stroke-opacity", 1)
      .transition()
        .duration(2000)
        .ease(Math.sqrt)
        .attr("r", 100)
        .style("stroke-opacity", 1e-6)
        .remove()
  svg = d3.select("#party")
        .append("svg:svg")
        .attr("width", width)
        .attr("height", height)
        .style("pointer-events", "all")
        .on("mousemove", particle)


