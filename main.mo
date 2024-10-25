import Buffer "mo:base/Buffer";
import Text "mo:base/Text";
import Time "mo:base/Time";

actor {
  type Post = {
    id: Nat;
    title: Text;
    content: Text;
    author: Text;
    timestamp: Time.Time;
  };

  var posts = Buffer.Buffer<Post>(0);

  public func createPost(title: Text, content: Text, author: Text) : async Nat {
    let id = posts.size();
    let newPost: Post = {
      id;
      title;
      content;
      author;
      timestamp = Time.now();
    };
    posts.add(newPost);
    id
  };

  public query func getPost(id: Nat) : async ?Post {
    if (id >= posts.size()) return null;
    ?posts.get(id)
  };

  public query func listPosts() : async [Post] {
    Buffer.toArray(posts)
  };
}