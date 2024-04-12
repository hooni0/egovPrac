package egovframework.example.table.service;

public class CardVO {
	
	private String cardId;
	private String hashTags;
	private String thumbNail;
	private String cardTitle;
	private String date;
	public String getCardId() {
		return cardId;
	}
	public void setCardId(String cardId) {
		this.cardId = cardId;
	}
	public String getHashTags() {
		return hashTags;
	}
	public void setHashTags(String hashTags) {
		this.hashTags = hashTags;
	}
	public String getThumbNail() {
		return thumbNail;
	}
	public void setThumbNail(String thumbNail) {
		this.thumbNail = thumbNail;
	}
	public String getCardTitle() {
		return cardTitle;
	}
	public void setCardTitle(String cardTitle) {
		this.cardTitle = cardTitle;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CardVO [cardId=");
		builder.append(cardId);
		builder.append(", hashTags=");
		builder.append(hashTags);
		builder.append(", thumbNail=");
		builder.append(thumbNail);
		builder.append(", cardTitle=");
		builder.append(cardTitle);
		builder.append(", date=");
		builder.append(date);
		builder.append("]");
		return builder.toString();
	}
	
	
	
}
