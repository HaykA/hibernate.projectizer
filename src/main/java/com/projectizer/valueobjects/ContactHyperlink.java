package com.projectizer.valueobjects;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Embeddable;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;

import com.projectizer.enums.HyperlinkType;

@Embeddable
public class ContactHyperlink implements Serializable {

	private static final long serialVersionUID = 1L;

	@Enumerated(EnumType.STRING)
	private HyperlinkType type;
	private String url;
	private String urlText;
	
	protected ContactHyperlink() {}
	
	public ContactHyperlink(HyperlinkType type, String url, String urlText) {
		this.type = type;
		this.url = url;
		this.urlText = urlText;
	}
	
	public String getUrl() {
		return url;
	}

	public String getUrlText() {
		return urlText;
	}
	
	public HyperlinkType getType() {
		return type;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (!(obj instanceof ContactHyperlink)) {
			return false;
		}
		ContactHyperlink contactHyperlink = (ContactHyperlink) obj;
		return contactHyperlink.url.equals(url) && contactHyperlink.urlText.equals(urlText)
				&& contactHyperlink.type.equals(type);
	}
	
	@Override
	public int hashCode() {
		int hash = 91;
        hash = 13 * hash + Objects.hashCode(url);
        hash = 13 * hash + Objects.hashCode(urlText);
        hash = 13 * hash + Objects.hashCode(type);
        return hash;
	}
	
}
