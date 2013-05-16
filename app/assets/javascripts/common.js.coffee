$ ->
  $(document).on "touchstart.dropdown.data-api", ".dropdown-menu", (event) ->
    event.stopPropagation()
  
  # TODO need refactoring
  $(document).on "click", "#order-form a.inc-by-1", ->
    $this = $(this)
    $tr = $this.closest("tr")
    $remaining = $tr.find(".remaining")
    $orderQuantity = $tr.find(".order-quantity")
    $remaining.text((parseFloat($remaining.text()) - 1).toFixed(1))
    $orderQuantity.val((1 + parseFloat($orderQuantity.val())).toFixed(1))
    $tr.css("background-color", "lemonchiffon")
    $tr.prev().css("background-color", "lemonchiffon")
    false
  $(document).on "click", "#order-form a.inc-by-0-5", ->
    $this = $(this)
    $tr = $this.closest("tr")
    $remaining = $tr.find(".remaining")
    $orderQuantity = $tr.find(".order-quantity")
    $remaining.text((parseFloat($remaining.text()) - 0.5).toFixed(1))
    $orderQuantity.val((0.5 + parseFloat($orderQuantity.val())).toFixed(1))
    $tr.css("background-color", "lemonchiffon")
    $tr.prev().css("background-color", "lemonchiffon")
    false
  $(document).on "click", "#order-form a.set-zero", ->
    $this = $(this)
    $tr = $this.closest("tr")
    $remaining = $tr.find(".remaining")
    $orderQuantity = $tr.find(".order-quantity")
    $remaining.text((parseFloat($remaining.text()) + parseFloat($orderQuantity.val())).toFixed(1))
    $orderQuantity.val((0).toFixed(1))
    $tr.css("background-color", "white")
    $tr.prev().css("background-color", "white")
    false
