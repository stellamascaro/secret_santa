# Secret Santa 🎅🎁

Um projeto divertido e interativo para organizar um sorteio de Amigo Oculto com envio automático de emails!

## Descrição

Este projeto permite a organização de um sorteio de Amigo Oculto de forma simples e eficiente. Começou bem básico, apenas para treinar meus conhecimentos de programação em Ruby e sem qualquer tipo de formatação, com o tempo foi ganhando mais cor e vida. Os participantes são sorteados aleatoriamente, e cada um recebe um email informando quem é o seu amigo oculto. Garantindo que ninguém tire a si mesmo e que não haja duplicações.

## Funcionalidades

- **Sorteio Aleatório**: Garante que cada participante receba um amigo oculto diferente.
- **Envio Automático de Emails**: Cada participante recebe um email com o resultado do sorteio.
- **Interface Atraente**: Layout e estilo ajustados para uma experiência visual agradável.
- **Verificação de Erros**: Checa automaticamente por duplicações e autotiragens.

## Tecnologias Utilizadas

- **Ruby**
- **Rails** (se aplicável)
- **SMTP** para envio de emails
- **HTML/CSS** para formatação dos emails
- **Gems** específicas para envio de emails e sorteio aleatório

## Configuração

Siga os passos abaixo para configurar e rodar o projeto localmente:

1. **Clone o Repositório**:
    ```sh
    git clone https://github.com/seu_usuario/secret_santa.git
    cd secret_santa
    ```

2. **Instale as Dependências**:
    ```sh
    bundle install
    ```

3. **Configure o SMTP**:
    Edite o arquivo `config/environments/development.rb` com as configurações do seu servidor de email.

4. **Execute o Projeto**:
    ```sh
    ruby app.rb
    ```

## Uso

Adicione os participantes e execute o script para sortear e enviar os emails. Certifique-se de ajustar os detalhes dos participantes e as configurações de email conforme necessário.

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir uma **issue** ou enviar um **pull request**.

1. Faça um **fork** do projeto.
2. Crie uma nova **branch** para suas mudanças:
    ```sh
    git checkout -b minha-feature
    ```
3. **Commit** suas mudanças:
    ```sh
    git commit -m "Minha nova feature"
    ```
4. **Push** para a branch:
    ```sh
    git push origin minha-feature
    ```
5. Abra um **pull request** no GitHub.

## Contato

Se você tiver alguma dúvida ou sugestão, sinta-se à vontade para me contatar!

---

Espero que você se divirta organizando seu Amigo Oculto! 🎉
