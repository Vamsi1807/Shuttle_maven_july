let slideIndex = 0;
    const slides = document.querySelector('.slides');
    const dots = document.querySelectorAll('.dot');

    function showSlide(index) {
      const totalSlides = slides.children.length;
      slideIndex = (index + totalSlides) % totalSlides;
      slides.style.transform = `translateX(${-slideIndex * 100}%)`;
      dots.forEach(dot => dot.classList.remove('active'));
      dots[slideIndex].classList.add('active');
    }

    function moveSlide(step) {
      showSlide(slideIndex + step);
    }

    function currentSlide(index) {
      showSlide(index - 1);
    }

    // Auto-slide every 5 seconds
    setInterval(() => moveSlide(1), 5000);

    // Initialize the first slide
    showSlide(slideIndex);/**
 * 
 */