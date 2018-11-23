package edu.nju.seg.symbc;

import java.util.Collections;
import java.util.Map;
import java.util.Map.Entry;

import gov.nasa.jpf.symbc.numeric.PathCondition;

public class LibraryPathCondition {
	static boolean flagSolved = false;

	public String smtlib = "";
	public Map<String, String> solution = Collections.<String, String>emptyMap();
	public LibraryConstraint header;
	int count = 0;

	private PathCondition npc = null;

	public LibraryPathCondition(PathCondition npc) {
		this.setNpc(npc);
		header = null;
	}

	public LibraryPathCondition make_copy(PathCondition npc) {
		LibraryPathCondition pc_new = new LibraryPathCondition(npc);
		pc_new.header = this.header;
		pc_new.count = this.count;
		return pc_new;
	}

	public void _addOpt(LibraryConstraint cc) {
		flagSolved = false;
		if (!hasConstraint(cc)) {
			cc.and = header;
			header = cc;
			count++;
		}
	}

	public int count() {
		return count;
	}

	public boolean hasConstraint(LibraryConstraint c) {
		LibraryConstraint t = header;

		while (t != null) {
			if (c.equals(t)) {
				return true;
			}

			t = t.and;
		}
		return false;
	}

	public String toString() {
		return "CPC # = " + count + ((header == null) ? "" : "\n" + header.toString()) + "\n" + "NPC " + npc.toString();
	}

	public PathCondition getNpc() {
		return npc;
	}

	public void setNpc(PathCondition npc) {
		this.npc = npc;
	}

	public Map<String, String> getSolution() {
		return this.solution;
	}

	public String printableStringSolution() {
		StringBuilder b = new StringBuilder();
		for (Entry<String, String> sol : solution.entrySet()) {
			b.append(sol.getKey()).append(" : \"").append(sol.getValue()).append("\"");
		}
		return b.toString();
	}
}
