package model.type;

public enum StatusType {

	PENDING_APPROVAL("Em aprovação"),
	APPROVED("Aprovada"),
	IN_PROGRESS("Em andamento"),
	COMPLETED("Finalizada");
	
	private String description;

	private StatusType(String description) {
		this.description = description;
	}

	public String getDescription() {
		return description;
	}
	
}
