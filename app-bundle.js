// Darkmode button logic
document.addEventListener("DOMContentLoaded", () => {
  const themeToggleBtn = document.getElementById("theme-toggle");
  const darkIcon = document.getElementById("theme-toggle-dark-icon");
  const lightIcon = document.getElementById("theme-toggle-light-icon");

  // Atualiza os ícones com base no tema atual
  function updateIcons() {
    if (document.documentElement.classList.contains("dark")) {
      darkIcon.classList.add("hidden");
      lightIcon.classList.remove("hidden");
    } else {
      darkIcon.classList.remove("hidden");
      lightIcon.classList.add("hidden");
    }
  }

  // Alterna o tema ao clicar no botão
  themeToggleBtn.addEventListener("click", () => {
    if (document.documentElement.classList.contains("dark")) {
      document.documentElement.classList.remove("dark");
      localStorage.setItem("color-theme", "light");
    } else {
      document.documentElement.classList.add("dark");
      localStorage.setItem("color-theme", "dark");
    }
    updateIcons();
  });

  // Inicializa o tema com base no armazenamento local
  if (localStorage.getItem("color-theme") === "dark") {
    document.documentElement.classList.add("dark");
  } else if (localStorage.getItem("color-theme") === "light") {
    document.documentElement.classList.remove("dark");
  }

  // Inicializa os ícones ao carregar a página
  updateIcons();
});
