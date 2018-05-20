  $(".tipp_goal").keyup(function () {
    if (this.value.length == this.maxLength) {
      $(this).next('.tipp_goal').focus();
    }
  });
