document.addEventListener("turbo:load", () => {
  addToggleListener("hamburger", "navbar-menu", "collapse");
  addToggleListener("account", "dropdown-menu", "active");
})

const addToggleListener = (selected_id, menu_id, toggle_class) => {
  const selected = document.getElementById(selected_id);
  if (selected) {
    selected.addEventListener("click", (e) => {
      e.preventDefault();
      const menu = document.getElementById(menu_id);
      menu.classList.toggle(toggle_class);
    });
  }
}