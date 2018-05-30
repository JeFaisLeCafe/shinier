function flipCard(){

  const s_round = '.s_round';

  document.querySelector(s_round).addEventListener('hover', (e) => {
    document.querySelector('.b_round').classList.toggle('b_round_hover');
  });

  document.querySelector(s_round).addEventListener('click', (e) => {
    document.querySelector('.flip_box').classList.toggle('flipped');
    e.currentTarget.classList.add('s_round_click');
    document.querySelector('.s_arrow').classList.toggle('s_arrow_rotate');
    document.querySelector('.b_round').classList.toggle('b_round_back_hover');
  })

  document.querySelector(s_round).addEventListener('transitionend', (e) => {
    e.currentTarget.classList.remove('s_round_click');
    e.currentTarget.classList.add('s_round_back');
  });
}


export { flipCard };
