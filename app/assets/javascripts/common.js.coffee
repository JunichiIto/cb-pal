$ ->
  # TODO need refactoring
  $(document).on("click", "#order-form a.inc-by-1", ->
    $this = $(this)
    $tr = $this.closest("tr")
    $remaining = $tr.find(".remaining")
    $orderQuantity = $tr.find(".order-quantity")
    $remaining.text((parseFloat($remaining.text()) - 1).toFixed(1))
    $orderQuantity.val((1 + parseFloat($orderQuantity.val())).toFixed(1))
    false
  )
  $(document).on("click", "#order-form a.inc-by-0-5", ->
    $this = $(this)
    $tr = $this.closest("tr")
    $remaining = $tr.find(".remaining")
    $orderQuantity = $tr.find(".order-quantity")
    $remaining.text((parseFloat($remaining.text()) - 0.5).toFixed(1))
    $orderQuantity.val((0.5 + parseFloat($orderQuantity.val())).toFixed(1))
    false
  )
  $(document).on("click", "#order-form a.set-zero", ->
    $this = $(this)
    $tr = $this.closest("tr")
    $remaining = $tr.find(".remaining")
    $orderQuantity = $tr.find(".order-quantity")
    $remaining.text((parseFloat($remaining.text()) + parseFloat($orderQuantity.val())).toFixed(1))
    $orderQuantity.val((0).toFixed(1))
    false
  )
