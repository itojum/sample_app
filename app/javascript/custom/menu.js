document.addEventListener("turbo:load", () => {
  const account = document.getElementById("account");
  if( account ) {
    account.addEventListener("click", (e) => {
      e.preventDefault();
      const menu = document.getElementById("dropdown-menu");
      menu.classList.toggle("active");
    });
  }
})