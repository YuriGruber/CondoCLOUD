<?php
include('dao/dao.php');;
?>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style.css">
        <meta charset="UTF-8">
        <title>CondoCLOUD</title>
        <script src="js/jquery-3.7.1.js"></script>
        <script src="js/lib.js"></script>
    </head>
    
    <header>
            <img class="logo" src="imagens/condocloud_icon.png" alt="Logo">
            <div>
                <span class="tituloParte1">CondoCLOUD</span> - <span class="tituloParte2">Soluções Condominiais</span>
            </div>
            <div class="nomeMorador">
            <?php echo getNomeUsuario()?>
          </div>
            <div class="nomeCondominio">
                <?php echo "Condomínio ".getNomeCondominio() ?>
          </div>
    </header>
    
    <body> 
        <aside>
            <div class="barraLateral">
                <a href="#">Unidade</a>
                <a href="#">2<sup>a</sup> via do boleto</a>
                <a href="#">Contato</a>
                <a href="#">Mudança</a>
                <a href="#">Informar problemas</a>
                <button class="dropdown-btn">Reservas
                  <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-container">
                  <a href="#" id="linkReservaArea">Reservar Espaço</a>
                  <a href="#" id="linkMinhasReservas">Consultar Reservas</a>
                </div>
                <a href="#">Procurar</a>
            </div>
        </aside>
        
        <div id="conteudoContainer" class="conteudoContainer" style="display: none;">
            <button id="fecharPagina" class="fecharPagina">X</button>
            <div id="paginaContainer"></div>           
        </div>

        <script>
            /* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
            var dropdown = document.getElementsByClassName("dropdown-btn");
            var i;

            for (i = 0; i < dropdown.length; i++) {
              dropdown[i].addEventListener("click", function() {
                this.classList.toggle("active");
                var dropdownContent = this.nextElementSibling;
                if (dropdownContent.style.display === "block") {
                  dropdownContent.style.display = "none";
                } else {
                  dropdownContent.style.display = "block";
                }
              });
            }
                     
            
            function carregarPagina(pagina){
                $('#paginaContainer').load(pagina);
                document.getElementById('conteudoContainer').style.display = 'block';
                document.getElementById('fecharPagina').style.display = 'block';
            }

              // Exemplo de troca de conteúdo ao clicar em um link
              $('#linkReservaArea').on('click', function(e) {
                e.preventDefault(); // Evitar o comportamento padrão de navegação do link
                carregarPagina('reservar_area.php');
              });
              
              $('#linkMinhasReservas').on('click', function(e) {
                e.preventDefault(); // Evitar o comportamento padrão de navegação do link
                carregarPagina('minhas_reservas.php');
              });
            
            // Função para fechar a página carregada e ocultar o container
            function fecharPagina() {
                // Oculta o conteúdo do container
                document.getElementById('conteudoContainer').style.display = 'none';

                // Limpa o conteúdo da página carregada (opcional)
                // Você pode querer implementar uma lógica específica para limpar ou resetar o conteúdo.
                document.getElementById('paginaContainer').innerHTML = '';
            }

            // Adiciona um listener ao botão de fechar
            document.getElementById('fecharPagina').addEventListener('click', fecharPagina);
            
        </script>
    </body>
</html>