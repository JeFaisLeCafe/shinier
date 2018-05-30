function flipCard(){


  document.querySelectorAll('.s_round').forEach((button) => {

    button.addEventListener('mouseover', (e) => {
    const previous = button.previousSibling.previousSibling;
      previous.classList.toggle('b_round_hover');
    });

    button.addEventListener('click', (e) => {
      const flip_box = button.previousSibling.parentNode.previousElementSibling;
      const s_round = button.previousSibling.nextElementSibling;
      const s_arrow = button.previousSibling.nextElementSibling.lastElementChild;
      const b_round = button.previousSibling.previousSibling;

      flip_box.classList.toggle('flipped');
      e.currentTarget.classList.add('s_round_click');
      s_arrow.classList.toggle('s_arrow_rotate');
      b_round.classList.toggle('b_round_back_hover');
    })

    button.addEventListener('transitionend', (e) => {
      e.currentTarget.classList.remove('s_round_click');
      e.currentTarget.classList.add('s_round_back');
    });

  });

};


export { flipCard };
