class MouseParty
  constructor: (target,width,height) ->
    @dispatcher = new WebSocketRails $(target).data('uri'), true
    @setupCanvas target,width,height
    @bindEvents()

  bindEvents: =>
    @dispatcher.bind 'mousemove', @mouseMove
    @dispatcher.bind 'client_connected', -> console.log 'client connected'
    @dispatcher.bind 'client_disconnected', -> console.log 'client disconnected'

  sendMouseMove: =>
    @dispatcher.trigger 'mousemove', cords: d3.svg.mouse(@svg[0][0])

  mouseMove: (message) =>
    @particle(message.cords)

  setupCanvas: (target,width,height) ->
    @colors = d3.scale.category20c()
    @color_index = 0
    @svg = d3.select(target)
          .append("svg:svg")
          .attr("width", width)
          .attr("height", height)
          .style("pointer-events", "all")
          .on "mousemove", => @sendMouseMove()

  resize: (width,height) =>
    @svg.attr("width", width)
        .attr("height", height)

  particle: (position)=>
    @svg.append("svg:circle")
        .attr("cx", position[0])
        .attr("cy", position[1])
        .attr("r", 1e-6)
        .style("stroke", @colors(++@color_index))
        .style("stroke-opacity", 1)
      .transition()
        .duration(2000)
        .ease(Math.sqrt)
        .attr("r", 100)
        .style("stroke-opacity", 1e-6)
        .remove()

$ ->
  party = new MouseParty '#party', $('document').width(), $('document').height()
  $(window).resize (w)->
    party.resize $('document').width(), $('document').height()


