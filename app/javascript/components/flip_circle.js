function flipCircle(){
  const cardCircle = document.querySelectorAll('.card-circle');
  cardCircle.forEach((card) => {
    console.log(card);
    card.addEventListener('click', (event) => {
      event.currentTarget.classList.toggle('flip');
    });
  });
};


export { flipCircle };
