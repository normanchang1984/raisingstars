function nofavoriteproposal(count){
  var favorite_button = $('#favorite_button');
  var user_follow = $('#user_follow');
  user_follow.text("目前有 " + count + " 人追蹤");
  favorite_button.text('已追蹤');
}

function favoriteproposal(count){
  var favorite_button = $('#favorite_button');
  var user_follow = $('#user_follow');
  user_follow.text("目前有 " + count + " 人追蹤");
  favorite_button.text('加入追蹤');
}
