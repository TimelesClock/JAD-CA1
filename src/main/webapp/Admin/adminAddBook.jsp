<%@ page import="classes.Author"%>
<%@ page import="classes.Publisher"%>
<%@ page import="classes.Genre"%>
<%@ page import="java.util.*"%>
<%
@SuppressWarnings("unchecked")
List<Author> authors = (List<Author>) request.getAttribute("authors");
@SuppressWarnings("unchecked")
List<Publisher> publishers = (List<Publisher>) request.getAttribute("publishers");
@SuppressWarnings("unchecked")
List<Genre> genres = (List<Genre>) request.getAttribute("genres");
%>
<body>
	<h1 class="text-2xl font-bold mb-4 ms-5">Add New Book</h1>
	<div class="container mx-auto mt-5">
		<form action="AdminPanelServlet" method="post" class="card"
			onsubmit="return encodeImage()" id = "form">
			<input type="hidden" name="action" value="addBook">
			<div class="card-body space-y-6">
				<div class="form-control">
					<label class="label"> <span class="label-text">Title</span></label>
					<input type="text" name="title" class="input input-bordered"
						required>
				</div>
				<div class="form-control">
					<label class="label"> <span class="label-text">Author</span></label>
					<select name="author_id" class="select select-bordered"
						onchange="handleAuthorSelection(this)" required>
						<option value="" disabled selected>Select the author</option>
						<option value="0">+ Add new Author</option>
						<%
						for (Author author : authors) {
						%>
						<option value="<%=author.getId()%>"><%=author.getName()%></option>
						<%
						}
						%>
					</select>
				</div>
				<div id="newAuthorForm" style="display: none;">
					<div class="form-control">
						<label class="label"> <span class="label-text">New
								Author Name</span></label> <input type="text" name="new_author_name"
							class="input input-bordered">
					</div>
				</div>
				<div class="form-control">
					<label class="label"> <span class="label-text">Price</span></label>
					<input type="number" step="0.01" name="price"
						class="input input-bordered" required>
				</div>
				<div class="form-control">
					<label class="label"> <span class="label-text">Quantity</span></label>
					<input type="number" name="quantity" class="input input-bordered"
						required>
				</div>
				<div class="form-control">
					<label class="label"> <span class="label-text">Publication
							Date</span></label> <input type="date" name="publication_date"
						class="input input-bordered" required>
				</div>
				<div class="form-control">
					<label class="label"> <span class="label-text">ISBN</span></label>
					<input type="text" name="ISBN" class="input input-bordered"
						required>
				</div>
				<div class="form-control">
					<label class="label"> <span class="label-text">Rating</span></label>
					<input type="number" name="rating" class="input input-bordered"
						required>
				</div>
				<div class="form-control">
					<label class="label"> <span class="label-text">Description</span></label>
					<textarea name="description" class="textarea textarea-bordered"
						required></textarea>
				</div>
				<div class="form-control">
					<label class="label"> <span class="label-text">Publisher</span></label>
					<select name="publisher_id" class="select select-bordered"
						onchange="handlePublisherSelection(this)" required>
						<option value="" disabled selected>Select the publisher</option>
						<option value="0">+ Add new Publisher</option>
						<%
						for (Publisher publisher : publishers) {
						%>
						<option value="<%=publisher.getId()%>"><%=publisher.getName()%></option>
						<%
						}
						%>
					</select>
				</div>
				<div id="newPublisherForm" style="display: none;">
					<div class="form-control">
						<label class="label"> <span class="label-text">New
								Publisher Name</span></label> <input type="text" name="new_publisher_name"
							class="input input-bordered">
					</div>
				</div>
				<div class="form-control">
					<label class="label"> <span class="label-text">Genre</span></label>
					<select name="genre_id" class="select select-bordered"
						onchange="handleGenreSelection(this)" required>
						<option value="" disabled selected>Select the genre</option>
						<option value="0">+ Add new Genre</option>
						<%
						for (Genre genre : genres) {
						%>
						<option value="<%=genre.getId()%>"><%=genre.getName()%></option>
						<%
						}
						%>
					</select>
				</div>
				<div id="newGenreForm" style="display: none;">
					<div class="form-control">
						<label class="label"> <span class="label-text">New
								Genre Name</span></label> <input type="text" name="new_genre_name"
							class="input input-bordered">
					</div>
				</div>
				<input type="hidden" id="image" name="image">
				<div class="form-control">
					<label class="label"> <span class="label-text">Image</span></label>
					<input type="file" id="imageInput" accept="image/jpeg, image/png"
						class="file-input file-input-bordered w-full" required> <small
						class="text-gray-500">Accepted file types: JPEG, PNG.
						Maximum file size: 5MB.</small>
				</div>
				<button type="submit" class="btn btn-primary"
					onclick="return validateForm();">Insert</button>
			</div>
		</form>
	</div>
	<script>
		function handleAuthorSelection(selectElement) {
			var newAuthorForm = document.getElementById("newAuthorForm");
			if (selectElement.value === "0") {
				newAuthorForm.style.display = "block";
				document.getElementsByName("new_author_name")[0].required = true;
			} else {
				newAuthorForm.style.display = "none";
				document.getElementsByName("new_author_name")[0].required = false;
				document.getElementsByName("new_author_name")[0].value = "";
			}
		}

		function handlePublisherSelection(selectElement) {
			var newPublisherForm = document.getElementById("newPublisherForm");
			if (selectElement.value === "0") {
				newPublisherForm.style.display = "block";
				document.getElementsByName("new_publisher_name")[0].required = true;
			} else {
				newPublisherForm.style.display = "none";
				document.getElementsByName("new_publisher_name")[0].required = false;
				document.getElementsByName("new_publisher_name")[0].value = "";
			}
		}

		function handleGenreSelection(selectElement) {
			var newGenreForm = document.getElementById("newGenreForm");
			if (selectElement.value === "0") {
				newGenreForm.style.display = "block";
				document.getElementsByName("new_genre_name")[0].required = true;
			} else {
				newGenreForm.style.display = "none";
				document.getElementsByName("new_genre_name")[0].required = false;
				document.getElementsByName("new_genre_name")[0].value = "";
			}
		}

		function encodeImage() {
			var imageInput = document.getElementById("imageInput");
			var file = imageInput.files[0];
			var reader = new FileReader();

			reader.onload = function(e) {
				var encodedImage = reader.result.split(',')[1];
				document.getElementById("image").value = encodedImage;
			}

			reader.readAsDataURL(file);

			return true;
		}
		function validateForm() {
			var imageInput = document.getElementById("imageInput");
			var file = imageInput.files[0];
			var maxSize = 5 * 1024 * 1024; // 5MB

			if (!file) {
				alert("Please select an image file.");
				return false;
			}

			if (file.size > maxSize) {
				alert("File size exceeds the maximum limit of 5MB.");
				return false;
			}

			var fileType = file.type;
			var validTypes = [ "image/jpeg", "image/png" ];
			if (!validTypes.includes(fileType)) {
				alert("Invalid file type. Only JPEG and PNG files are accepted.");
				return false;
			}

			var reader = new FileReader();
			reader.onload = function(e) {
				var encodedImage = reader.result.split(',')[1];
				document.getElementById("image").value = encodedImage;

				document.getElementById("form").submit();
			};
			reader.readAsDataURL(file);

			return false;
		}
	</script>
</body>
