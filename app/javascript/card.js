const pay = () => {
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    console.log("フォーム送信イベントを定義")
  });
};

window.addEventListener("load", pay);