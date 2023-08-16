
interface Comment {
  username: string;
  comment: string;
  timestamp: Date;
}

let comments: Comment[] = [];

app.get('/', (req, res) => {
  res.render('index', { comments });
});

app.post('/comment', (req, res) => {
  const { username, comment } = req.body;

  if (!comment.trim()) { //verifica se algum comentário foi escrito
    res.status(400).send('Comment cannot be empty.');
    return;
  }

  const newComment: Comment = { username, comment, timestamp: new Date() };
  comments.unshift(newComment);
  res.redirect('/');
});

//edição de comentário
app.put('/edit/:commentId', (req, res) => {
  const { commentId } = req.params;
  const { comment } = req.body;

  const targetComment = comments.find(
    (c) => c.timestamp.getTime() === parseInt(commentId)
  );

  if (!targetComment) {
    res.status(404).json({ message: 'Comment not found.' });
    return;
  }

  if (targetComment.username !== req.body.username) {
    res.status(403).json({ message: 'You are not authorized to edit this comment.' });
    return;
  }

  targetComment.comment = comment;
  res.status(200).json({ message: 'Comment updated successfully.' });
});

